#!/bin/bash

# llama.cpp commit 1cfb5372cf5707c8ec6dde7c874f4a44a6c4c915

set -eo pipefail

cd "$(dirname "$0")" || exit

REFRESH=no
if [ "$1" == "--help" ]
then
  echo "$0 [options_for_llama.cpp...]"
  echo "$0 --refresh [options_for_llama.cpp...]"
  exit 1
elif [ "$1" == "--refresh" ]
then
  REFRESH=yes
  shift
fi

if [[ -z "${CHAT_SAVE_DIR+x}" ]]; then
    echo >&2 "error: CHAT_SAVE_DIR must be provided"
    exit 1
fi

MAIN="$HOME/src/llama.cpp.runs8/build/bin/main"
MODEL="${MODEL:-./models/13B/ggml-model-q4_0.bin}"
PROMPT_HEADER="${PROMPT_HEADER:-./prompt_header.txt}"
USER_NAME="${USER_NAME:-User}"
AI_NAME="${AI_NAME:-ChatBot}"
DATE_TIME="$(date +%H:%M)"
DATE_YEAR="$(date +%Y)"
IFS=',' read -r -a QUESTION_FILES <<<"$QUESTION_FILES"
if [ "${#QUESTION_FILES[@]}" == "0" ]
then
  echo >&2 "Comma separated QUESTION_FILES not specified"
  exit 1
fi

if [ ! -e "$MODEL" ]
then
  echo >&2 "error: $MODEL not found. Specify valid value for MODEL"
  exit 1
fi

LOG="${CHAT_SAVE_DIR}/main.log"
LOG_BG="${CHAT_SAVE_DIR}/main-bg.log"
PARSED_PROMPT_HEADER="${CHAT_SAVE_DIR}/parsed_header.txt"
HEADER_CACHE_FILE="${CHAT_SAVE_DIR}/header-cache.bin"
CUR_PROMPT_FILE="${CHAT_SAVE_DIR}/current-prompt.txt"
CUR_PROMPT_CACHE="${CHAT_SAVE_DIR}/current-cache.bin"
NEXT_PROMPT_FILE="${CHAT_SAVE_DIR}/next-prompt.txt"
NEXT_PROMPT_CACHE="${CHAT_SAVE_DIR}/next-cache.bin"
CHAT_LOG="${CHAT_LOG:-${CHAT_SAVE_DIR}/overall_log.txt}"

BOT_THOUGHTS="${BOT_THOUGHTS:-no}"
BOT_THOUGHTS_VISIBLE="${BOT_THOUGHTS_VISIBLE:-no}"

EXACT_MATCH_MSG_PATTERN='main: session file has exact match for prompt'
PROMPT_SIZE_MSG_PATTERN='main: loaded a session with prompt size of [[:digit:]]+'
SESSION_SIZE_MSG_PATTERN='main: session file matches [[:digit:]]+ / [[:digit:]]+'
SESSION_SIZE_MSG_PATTERN2='main: warning: session file has low similarity to prompt \([[:digit:]]+ / [[:digit:]]+'
SAMPLE_TIME_MSG_PATTERN='sample time =[[:space:]]+[[:digit:]]+.[[:digit:]]+ ms /[[:space:]]+[[:digit:]]+'

THREAD_COUNT="${THREAD_COUNT:-8}"
CTX_SIZE=4096
CTX_ROTATE_POINT=$((CTX_SIZE * 2 / 5))
OPTS=(--model "$MODEL" --ctx_size "$CTX_SIZE" --repeat_last_n 256 "$@")
NEXT_PROMPT_PID=0

# An unbuffered `tail -c+N`
skip_bytes() {
    LANG=C IFS= read -r -n "$1" -d '' c
    while LANG=C IFS= read -r -n 1 -d '' c; do
        printf '%s' "$c"
    done
}

parse_prompt_header() {
  cat "$PROMPT_HEADER" |
    sed -e "s/\[\[USER_NAME\]\]/${USER_NAME}/g" \
        -e "s/\[\[AI_NAME\]\]/${AI_NAME}/g" \
        -e "s/\[\[AGE\]\]/${AGE}/g" \
        -e "s/\[\[GENDER\]\]/${GENDER}/g" >"$PARSED_PROMPT_HEADER"
}
parse_header_ifnew() {
  if [ "$PROMPT_HEADER" -nt "$PARSED_PROMPT_HEADER" ]
  then
    parse_prompt_header
  fi
}

mkdir -p "$CHAT_SAVE_DIR"
touch "$LOG"
trap "tail -n100 ${LOG}" ERR

touch "$CHAT_LOG"

REGEN_PROMPT_PID=0
regenerate_header_cache() {
  RUN_REGEN=no
  if [ $REGEN_PROMPT_PID -eq 0 ]
  then
    RUN_REGEN=yes
  elif kill -0 $REGEN_PROMPT_PID 2>/dev/null
  then
    RUN_REGEN=no
  else
    RUN_REGEN=yes
  fi
  if [ "$RUN_REGEN" == "yes" ]
  then
    parse_prompt_header
    nice -n 19 "$MAIN" >/dev/null 2>>"$LOG_BG" \
        -t "$THREAD_COUNT" \
        --batch_size 8 \
        "${OPTS[@]}" \
        --prompt-cache "$HEADER_CACHE_FILE" \
        --file "$PARSED_PROMPT_HEADER" \
        --n_predict 1 &
    REGEN_PROMPT_PID=$!
  fi
}


echo 'Regenerating header cache...'
regenerate_header_cache
wait
echo 'Done!'

cat "$PARSED_PROMPT_HEADER" >"$CUR_PROMPT_FILE"
cat "$PARSED_PROMPT_HEADER" >"$CHAT_LOG"

cp "$HEADER_CACHE_FILE" "$CUR_PROMPT_CACHE"

printf '%s ' "$(< "$CUR_PROMPT_FILE")"

if [[ "$(tail -n1 "$CUR_PROMPT_FILE")" != "${USER_NAME}:" ]]; then
  printf '\n'
else
  printf '\r'
fi
QNUM=0
for QFILE in "${QUESTION_FILES[@]}"
do
  QNUM=$((QNUM + 1))
  line="$(echo $(cat "$QFILE"))"

  echo "${USER_NAME}: ${line}"
  echo "${USER_NAME}: ${line}" >>"$CUR_PROMPT_FILE"
  echo "${USER_NAME}: ${line}" >>"$CHAT_LOG"

  n_prompt_len_pre=$(($(wc -c <"$CUR_PROMPT_FILE")))
  n_prompt_len_preboth="$n_prompt_len_pre"

  if [ "$BOT_THOUGHTS" == "yes" ]
  then
    if [ "$BOT_THOUGHTS_VISIBLE" == "yes" ]
    then
      THOUGHT_DISPLAY="/dev/stdout"
    else
      THOUGHT_DISPLAY="/dev/null"
      printf '*thinking*'
    fi

    printf '* %s thinks:' "$AI_NAME" >>"$CUR_PROMPT_FILE"

    nice -n 18 "$MAIN" 2>>"$LOG" "${OPTS[@]}" \
        -t "$THREAD_COUNT" \
        --prompt-cache "$CUR_PROMPT_CACHE" \
        --prompt-cache-all \
        --file "$CUR_PROMPT_FILE" \
        --reverse-prompt "
" \
        --n_predict 200 |
      skip_bytes 1 |                  # skip BOS token added by ./main
      tee "$CUR_PROMPT_FILE.tmp" |    # save prompt + generation to tmp file
      skip_bytes "$n_prompt_len_pre" | # print generation
      tee "$CUR_PROMPT_FILE.lastthought" |
      cat >$THOUGHT_DISPLAY

    mv "$CUR_PROMPT_FILE.tmp" "$CUR_PROMPT_FILE"
    cat "$CUR_PROMPT_FILE.lastthought" >>"$CHAT_LOG"
    if [[ "$(tail -c 1 "$CUR_PROMPT_FILE")" != "$(printf '\n')" ]]
    then
      if [ "$BOT_THOUGHTS_VISIBLE" == "yes" ]
      then
        printf '\n'
      fi
      printf '\n'>>"$CUR_PROMPT_FILE"
      printf '\n'>>"$CHAT_LOG"
    fi

    if [ "$BOT_THOUGHTS_VISIBLE" != "yes" ]
    then
      printf '\r                                              \r'
    fi

    n_prompt_len_pre=$(($(wc -c <"$CUR_PROMPT_FILE")))
  fi

  if [[ "$(tail -n1 "$CUR_PROMPT_FILE")" != "${AI_NAME}:" ]]; then
    printf '%s:' "$AI_NAME" >>"$CUR_PROMPT_FILE"
  fi

  nice -n 18 "$MAIN" 2>>"$LOG" "${OPTS[@]}" \
      -t "$THREAD_COUNT" \
      --prompt-cache "$CUR_PROMPT_CACHE" \
      --prompt-cache-all \
      --file "$CUR_PROMPT_FILE" \
      --reverse-prompt "
" \
      --n_predict 200 |
    skip_bytes 1 |                  # skip BOS token added by ./main
    tee "$CUR_PROMPT_FILE.tmp" |    # save prompt + generation to tmp file
    skip_bytes "$n_prompt_len_pre" | # print generation
    tee "$CUR_PROMPT_FILE.lastline"

  cat "$CUR_PROMPT_FILE.lastline" |
    perl -ne "s/$AI_NAME://; s/^\s+|\s+$//g; print \"\$_\\n\";" >${OUT_PREFIX}Q${QNUM}.txt

  mv "$CUR_PROMPT_FILE.tmp" "$CUR_PROMPT_FILE"
  cat "$CUR_PROMPT_FILE.lastline" >>"$CHAT_LOG"

  if [[ "$(tail -c 1 "$CUR_PROMPT_FILE")" != "$(printf '\n')" ]]
  then
    printf '\n'
    printf '\n' >>"$CUR_PROMPT_FILE"
    printf '\n' >>"$CHAT_LOG"
  fi
done


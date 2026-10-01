# Clear data 
rm(list=ls())
setwd('ADD PATH')

# CBType =============================================================

# Set up 3 plots horizontally
par(mfrow = c(1,3),
    mar = c(5, 4, 3, 1),
    oma = c(0, 0, 0, 0))

# human --------------------------

# means
means.st <- c(.434,.448,.301,.441)
means.con <- c(.990,.948,.935,.989)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c('1.a','1.b','2.a','2.b')
row.names(means) <- cond; means

# SEs
SEs.st <- c(.050,.051,.048,.052)
SEs.con <- c(.010,.023,.026,.011)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c('1.a','1.b','2.a','2.b')  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "Proportion correct",
                col = c('blue', 'light blue', 'dark green', 'light green'),
                main = "Human", 
                #xlab = expression(italic("F") * "(3, 373) = 1.20, " * italic("p") * " = .309"),
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

legend(x='topleft',legend=c('1a',
                            '1b',
                            '2a',
                            '2b'),
       pch=15,
       col = c('blue', 'light blue', 'dark green', 'light green'),cex=1.5,
       bty='n')

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.13, lwd = 3)

# Panel label
mtext("A", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# LLama 2 --------------------------

# means
means.st <- c(.384,.133,.094,.051)
means.con <- c(.775,.857,.898,.763)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c('1.a','1.b','2.a','2.b')
row.names(means) <- cond; means

# SEs
SEs.st <- c(.024,.017,.015,.011)
SEs.con <- c(.021,.018,.016,.022)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c('1.a','1.b','2.a','2.b')  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "", 
                #xlab = expression(italic("F") * "(3, 1516) = 42.89, " * italic("p") * " < .001"),
                col = c('blue', 'light blue', 'dark green', 'light green'),
                main = "Llama 2",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

# legend(x='topleft',legend=c('1a',
#                             '1b',
#                             '2a',
#                             '2b'),
#        pch=15,
#        col = c('blue', 'light blue', 'dark green', 'light green'),cex=1.5,
#        bty='n')
#axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd = 3)

# Panel label
mtext("B", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# Mixtral --------------------------

# means
means.st <- c(.561,.526,.645,.766)
means.con <- c(.977,.977,.927,1)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c('1.a','1.b','2.a','2.b')
row.names(means) <- cond; means

# SEs
SEs.st <- c(.025,.026,.025,.022)
SEs.con <- c(.007,.008,.013,0)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c('1.a','1.b','2.a','2.b')  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "", 
                #xlab = expression(italic("F") * "(3, 1516) = 16.57, " * italic("p") * " < .001"),
                col = c('blue', 'light blue', 'dark green', 'light green'),
                main = "Mixtral",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

# legend(x='topleft',legend=c('1a',
#                             '1b',
#                             '2a',
#                             '2b'),
#        pch=15,
#        col = c('blue', 'light blue', 'dark green', 'light green'),cex=1.5,
#        bty='n')
#axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1,lwd=3) 

# Panel label
mtext("C", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# overall accuracy =============================================================

# NOTE:  We discussed presenting these separately or together. 
#        I'll let you two decide which you prefer. 

# Human ----------------------

# means
means.st <- c(.407)
means.con <- c(.966)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c(1)
row.names(means) <- cond; means

# SEs
SEs.st <- c(.025)
SEs.con <- c(.009)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c(1)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "Proportion correct", xlab = "",
                col = c('blue', 'light blue'),
                #main = "Problem type accuracy (Human)",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)


#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd = 3)

# Panel label
mtext("A", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# Llama 2 ----------------------

# means
means.st <- c(.169)
means.con <- c(.823)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c(1)
row.names(means) <- cond; means

# SEs
SEs.st <- c(.010)
SEs.con <- c(.010)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c(1)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "Proportion correct", xlab = "",
                col = c('blue', 'light blue'),
                #main = "Problem type accuracy (LLAMA 2)",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)


#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1,lwd = 3)  

# Panel label
mtext("B", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# Mixtral ----------------------

# means
means.st <- c(.623)
means.con <- c(.970)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c(1)
row.names(means) <- cond; means

# SEs
SEs.st <- c(.012)
SEs.con <- c(.004)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c(1)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "Proportion correct", xlab = "",
                col = c('blue', 'light blue'),
                #main = "Problem type accuracy (Mixtral)",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)


#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd = 3)

# Panel label
mtext("C", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)

# Overall --------------------------

# means
means.st <- c(.407,.169,.623)
means.con <- c(.966,.823,.970)
means <- rbind(means.st,means.con)
means <- t(means)
cond <- c(1,2,3)
row.names(means) <- cond; means

# SEs
SEs.st <- c(.025,.010,.012)
SEs.con <- c(.009,.010,.004)
SEs <- rbind(SEs.st,SEs.con)
SEs <- t(SEs)
cond <- c(1,2,3)  
row.names(SEs) <- cond; SEs

par(mfrow = c(1, 1))


# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Standard','Control'),
                ylab = "Proportion correct", xlab = "",
                col = c('blue', 'light blue', 'dark green'),
                #main = "Problem type accuracy across datasets",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

legend(x='topleft',legend=c('Human',
                            'LLAMA2',
                            'Mixtral'),
       pch=15,
       col = c('blue', 'light blue', 'dark green'),cex=1.5,
       bty='n')
#axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd = 3) 

# # Add stats
# text(x = 5.5, y = 1.1, 
#      labels = expression(italic("F") * "(3, 1516) = 20.02, " * italic("p") * " < .001"))
# 
# Ratings =====================================================================

# Set up 3 plots horizontally
par(mfrow = c(1,3),
    mar = c(5, 4, 3, 1),
    oma = c(0, 0, 0, 0))

# Human  

# means
means.conf <- c(.915,.947)
means.opin <- c(.753,.841)
means <- rbind(means.conf,means.opin)
means <- t(means)
cond <- c(1,2)
row.names(means) <- cond; means

# SEs
SEs.conf <- c(.010,.008)
SEs.opin <- c(.011,.010)
SEs <- rbind(SEs.conf,SEs.opin)
SEs <- t(SEs)
cond <- c(1,2)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Self','Other'),
                ylab = "Rating", xlab = "",
                col = c('blue', 'light blue', 'blue', 'light blue'),
                main = "Human",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

legend(x='topright',legend=c('Standard',
                             'Control'),
       pch=15,
       col = c('blue', 'light blue'),cex=1.5,
       bty='n')
#axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd=3) 

# Panel label
mtext("A", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)


# Llama 2  

# means
means.conf <- c(.737,.785)
means.opin <- c(.601,.671)
means <- rbind(means.conf,means.opin)
means <- t(means)
cond <- c(1,2)
row.names(means) <- cond; means

# SEs
SEs.conf <- c(.004,.004)
SEs.opin <- c(.005,.005)
SEs <- rbind(SEs.conf,SEs.opin)
SEs <- t(SEs)
cond <- c(1,2)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Self','Other'),
                ylab = "", xlab = "",
                col = c('blue', 'light blue', 'blue', 'light blue'),
                main = "Llama 2",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

# legend(x='topright',legend=c('Standard',
#                             'Control'),
#        pch=15,
#        col = c('blue', 'light blue'),cex=1.5,
#        bty='n')
# #axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd=3)

# Panel label
mtext("B", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)


# Mixtral  

# means
means.conf <- c(.870,.927)
means.opin <- c(.587,.740)
means <- rbind(means.conf,means.opin)
means <- t(means)
cond <- c(1,2)
row.names(means) <- cond; means

# SEs
SEs.conf <- c(.004,.003)
SEs.opin <- c(.005,.005)
SEs <- rbind(SEs.conf,SEs.opin)
SEs <- t(SEs)
cond <- c(1,2)  
row.names(SEs) <- cond; SEs

# plot
bp.1 <- barplot(means, ylim = c(0,1), beside = T,
                names.arg = c('Self','Other'),
                ylab = "", xlab = "",
                col = c('blue', 'light blue', 'blue', 'light blue'),
                main = "Mixtral",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

# legend(x='topright',legend=c('Standard',
#                             'Control'),
#        pch=15,
#        col = c('blue', 'light blue'),cex=1.5,
#        bty='n')
# #axis(2,cex.axis=2)

#add error bars
arrows(bp.1,means-SEs,bp.1,means+SEs,code = 3,angle = 90, length = 0.1, lwd=3) 

# Panel label
mtext("C", side = 3, adj = 0, line = 0.5,
      font = 2, cex = 1.5)


# Response proportions for correct, intuitive, and other========================  

# set working directory and load in data file

setwd('ADD PATH')
d <- read.csv('output_MIX.HU.L2_lab.csv', header=TRUE, sep=','); head(d)

# figure -------------------------

# get counts
counts <- table(d$StandardAcc_lab,d$Dataset); counts
human_counts <- counts[,1]/sum(counts[,1]); human_counts
Llama2_counts <- counts[,2]/sum(counts[,2]); Llama2_counts
MIXTRAL_counts <- counts[,3]/sum(counts[,3]); MIXTRAL_counts
counts <- rbind(human_counts,Llama2_counts,MIXTRAL_counts); counts
counts <- t(counts); counts

par(mfrow = c(1, 1))


# plot
bp.1 <- barplot(counts, ylim = c(0,1), beside = T,
                names.arg = c('Human','Llama 2','Mixtral'),
                ylab = "Response proportion", xlab = "",
                col = c('blue', 'light blue', 'dark green'),
                #main = "Response proportions by type across datasets",
                cex.lab = 1.5,
                cex.axis = 1.5,
                cex.names = 1.5,
                cex.main = 1.5)

legend(x='topleft',legend=c('Correct','Intuitive','Other'),
       pch=15,
       col = c('blue', 'light blue', 'dark green'),cex=1.5,
       bty='n')
#axis(2,cex.axis=2)


# Set layout for multiple plots
par(mfrow = c(3, 2),
    oma = c(2, 2, 3, 2))  # extra outer margin for legends

# -------------------------------
# Experiment 1 Means and SEM
# -------------------------------

# exp1_means <- matrix(c(
#   .915, .947,
#   .753, .841,
#   .870, .927,
#   .587, .740
# ), nrow = 2)
# 
# exp1_sem <- matrix(c(
#   .010, .008,
#   .011, .010,
#   .004, .003,
#   .005, .005
# ), nrow = 2)

setwd('C:/Users/jerom/OneDrive - University of Massachusetts/Projects/LLM and CRT project/Results/Results for figures')
d <- read.csv('output_MIX.HU.L2_lab.csv', header=TRUE, sep=',', na.strings = c('-999', '-999.00')); head(d)
d <- d[d$Dataset!='Llama2',]

# standard acc == correct/intuitive
# d <- d[d$StandardAcc_lab=="correct",]
# d <- d[d$StandardAcc_lab=="intuitive",]

# Aggregate means by Dataset and Type (CRT vs Control)
exp1_means_df <- aggregate(cbind(StandardConfidence, StandardOpinion,
                                 ControlConfidence, ControlOpinion) ~ Dataset,
                           data = d,
                           FUN = mean,
                           na.rm = TRUE)

# Manually reorder the columns into the original layout

# Extract numeric columns
numeric_means <- exp1_means_df[, c("StandardConfidence", "StandardOpinion",
                                   "ControlConfidence", "ControlOpinion")]

# Create the 2x4 matrix exactly matching the original layout
exp1_means <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT / Standard (Self/Other)
exp1_means[1, ] <- c(numeric_means$StandardConfidence[1], numeric_means$StandardOpinion[1],
                     numeric_means$StandardConfidence[2], numeric_means$StandardOpinion[2])

# Row 2 = Control (Self/Other)
exp1_means[2, ] <- c(numeric_means$ControlConfidence[1], numeric_means$ControlOpinion[1],
                     numeric_means$ControlConfidence[2], numeric_means$ControlOpinion[2])

exp1_means

# SEM function
sem <- function(x) {
  sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x)))
}

# Aggregate SEM by Dataset
sem_df <- aggregate(cbind(StandardConfidence, StandardOpinion,
                          ControlConfidence, ControlOpinion) ~ Dataset,
                    data = d,
                    FUN = sem)

# Manually reorder into the same 2x4 layout as the means
sem_matrix <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT/Standard (Self/Other)
sem_matrix[1, ] <- c(sem_df$StandardConfidence[1], sem_df$StandardOpinion[1],
                     sem_df$StandardConfidence[2], sem_df$StandardOpinion[2])

# Row 2 = Control (Self/Other)
sem_matrix[2, ] <- c(sem_df$ControlConfidence[1], sem_df$ControlOpinion[1],
                     sem_df$ControlConfidence[2], sem_df$ControlOpinion[2])

exp1_sem <- sem_matrix


new_order <- c(1,2,3,4)
exp1_means <- exp1_means[, new_order]
exp1_sem   <- exp1_sem[, new_order]

rownames(exp1_means) <- c("CRT","Control")
rownames(exp1_sem) <- rownames(exp1_means)

colnames(exp1_means) <- c("Self (Hu)","Other (Hu)","Self (LLM)","Other (LLM)")
colnames(exp1_sem) <- colnames(exp1_means)

# Plot
bp <- barplot(exp1_means,
              beside = TRUE,
              col = c("grey30","grey70"),
              ylim = c(0,1),
              ylab = "Mean Rating",
              legend.text = FALSE,
              main = "Experiment 1")

mtext("A",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

legend("topright",
       inset = c(0,-.3),
       xpd = NA,
       #horiz = TRUE,
       bty = "n",
       fill = c("grey30","grey70"),
       legend = c("CRT","Control"),
       xjust = 0.5)

# Error bars
arrows(bp,
       exp1_means - exp1_sem,
       bp,
       exp1_means + exp1_sem,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)

# -------------------------------
# Experiment 2 Means and SEM
# -------------------------------

# exp2_means <- matrix(c(
#   3.813, 3.210,
#   3.708, 3.437,
#   4.120, 3.870,
#   3.238, 3.247
# ), nrow = 2) / 5
# 
# exp2_sem <- matrix(c(
#   .060, .076,
#   .043, .048,
#   .034, .040,
#   .051, .043
# ), nrow = 2) / 5

setwd('ADD PATH')
d <- read.csv('B&P_Human&LLM.csv', header=TRUE, sep=',')

# # CRT == correct/intuitive on average
#d <- d[d$CRT_avg_corr>3.5,] # more correct on average
#d <- d[d$CRT_avg_corr<3.5,] # more intuitive on average


exp2_means_df <- aggregate(cbind(CRT_Est_avg, CRT_Est_other_avg,
                                 Num_Est_avg, Num_Est_other_avg) ~ Dataset,
                           data = d,
                           FUN = mean,
                           na.rm = TRUE)

exp2_means <- rbind(
  c(exp2_means_df$CRT_Est_avg[exp2_means_df$Dataset == "Human"],
    exp2_means_df$Num_Est_avg[exp2_means_df$Dataset == "Human"]),
  
  c(exp2_means_df$CRT_Est_other_avg[exp2_means_df$Dataset == "Human"],
    exp2_means_df$Num_Est_other_avg[exp2_means_df$Dataset == "Human"]),
  
  c(exp2_means_df$CRT_Est_avg[exp2_means_df$Dataset == "LLM"],
    exp2_means_df$Num_Est_avg[exp2_means_df$Dataset == "LLM"]),
  
  c(exp2_means_df$CRT_Est_other_avg[exp2_means_df$Dataset == "LLM"],
    exp2_means_df$Num_Est_other_avg[exp2_means_df$Dataset == "LLM"])
) / 5

exp2_means <- t(exp2_means)

exp2_sem_df <- aggregate(
  cbind(CRT_Est_avg, CRT_Est_other_avg,
        Num_Est_avg, Num_Est_other_avg) ~ Dataset,
  data = d,
  FUN = sem
)

exp2_sem <- rbind(
  c(exp2_sem_df$CRT_Est_avg[exp2_sem_df$Dataset == "Human"],
    exp2_sem_df$Num_Est_avg[exp2_sem_df$Dataset == "Human"]),
  
  c(exp2_sem_df$CRT_Est_other_avg[exp2_sem_df$Dataset == "Human"],
    exp2_sem_df$Num_Est_other_avg[exp2_sem_df$Dataset == "Human"]),
  
  c(exp2_sem_df$CRT_Est_avg[exp2_sem_df$Dataset == "LLM"],
    exp2_sem_df$Num_Est_avg[exp2_sem_df$Dataset == "LLM"]),
  
  c(exp2_sem_df$CRT_Est_other_avg[exp2_sem_df$Dataset == "LLM"],
    exp2_sem_df$Num_Est_other_avg[exp2_sem_df$Dataset == "LLM"])
) / 5

exp2_sem <- t(exp2_sem)

exp2_means <- exp2_means[, new_order]
exp2_sem   <- exp2_sem[, new_order]

rownames(exp2_means) <- c("CRT","Control")
rownames(exp2_sem) <- rownames(exp2_means)

colnames(exp2_means) <- c("Self (Hu)","Other (Hu)","Self (LLM)","Other (LLM)")
colnames(exp2_sem) <- colnames(exp2_means)

# Plot
bp <- barplot(exp2_means,
              beside = TRUE,
              col = c("grey30","grey70"),
              ylim = c(0,1),
              ylab = "Mean Rating",
              legend.text = FALSE,
              main = "Experiment 2")

mtext("B",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

legend("topright",
       inset = c(0,-.3),
       xpd = NA,
       #horiz = TRUE,
       bty = "n",
       fill = c("grey30","grey70"),
       legend = c("CRT","Control"),
       xjust = 0.5)
# Error bars
arrows(bp,
       exp2_means - exp2_sem,
       bp,
       exp2_means + exp2_sem,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)

# -------------------------------
# Delta Plots (CRT − Control)
# -------------------------------

crt <- as.numeric(exp1_means[1,])
control <- as.numeric(exp1_means[2,])

crt_sem <- as.numeric(exp1_sem[1,])
control_sem <- as.numeric(exp1_sem[2,])

diff_means <- crt - control
diff_sem <- sqrt(crt_sem^2 + control_sem^2)

diff_means <- diff_means[new_order]
diff_sem <- diff_sem[new_order]

names(diff_means) <- c("Self (Hu)","Other (Hu)","Self (LLM)","Other (LLM)")
names(diff_sem)   <- names(diff_means)

bp <- barplot(diff_means,
              ylim=c(-.2, 0),
              col="grey60",
              ylab="CRT − Control",
              main="Delta (Exp. 1)")

mtext("C",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp,
       diff_means - diff_sem,
       bp,
       diff_means + diff_sem,
       angle=90,
       code=3,
       length=.05,
       lwd=3)

# -------------------------------
# Experiment 2 delta
# -------------------------------

crt.2 <- as.numeric(exp2_means[1,])
control.2 <- as.numeric(exp2_means[2,])

crt_sem.2 <- as.numeric(exp2_sem[1,])
control_sem.2 <- as.numeric(exp2_sem[2,])

diff_means.2 <- crt.2 - control.2
diff_sem.2 <- sqrt(crt_sem.2^2 + control_sem.2^2)

diff_means.2 <- diff_means.2[new_order]
diff_sem.2 <- diff_sem.2[new_order]

names(diff_means.2) <- c("Self (Hu)","Other (Hu)","Self (LLM)","Other (LLM)")
names(diff_sem.2)   <- names(diff_means.2)

bp <- barplot(diff_means.2,
              ylim=c(0,.2),
              col="grey60",
              ylab="CRT − Control",
              main="Delta (Exp. 2)")

mtext("D",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp,
       diff_means.2 - diff_sem.2,
       bp,
       diff_means.2 + diff_sem.2,
       angle=90,
       code=3,
       length=.05,
       lwd=3)

# -------------------------------
# Difference of Deltas (Exp 1)
# -------------------------------

diffdiff_means <- c(
  diff_means["Self (Hu)"] - diff_means["Other (Hu)"],
  diff_means["Self (LLM)"] - diff_means["Other (LLM)"]
)

diffdiff_sem <- c(
  sqrt(diff_sem["Self (Hu)"]^2 + diff_sem["Other (Hu)"]^2),
  sqrt(diff_sem["Self (LLM)"]^2 + diff_sem["Other (LLM)"]^2)
)

names(diffdiff_means) <- c("Hu (Self−Other)", "LLM (Self−Other)")
names(diffdiff_sem) <- names(diffdiff_means)

diffdiff_means_exp.1 <- diffdiff_means 
diffdiff_sem_exp.1 <- diffdiff_sem

bp <- barplot(diffdiff_means,
              ylim = c(0,.2),
              col = "grey40",
              ylab = "ΔSelf − ΔOther",
              main = "E. Diff of Deltas (Exp. 1)")

mtext("E",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp,
       diffdiff_means - diffdiff_sem,
       bp,
       diffdiff_means + diffdiff_sem,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)

# -------------------------------
# Difference of Deltas (Exp 2)
# -------------------------------

diffdiff_means.2 <- c(
  diff_means.2["Self (Hu)"] - diff_means.2["Other (Hu)"],
  diff_means.2["Self (LLM)"] - diff_means.2["Other (LLM)"]
)

diffdiff_sem.2 <- c(
  sqrt(diff_sem.2["Self (Hu)"]^2 + diff_sem.2["Other (Hu)"]^2),
  sqrt(diff_sem.2["Self (LLM)"]^2 + diff_sem.2["Other (LLM)"]^2)
)

names(diffdiff_means.2) <- c("Hu (Self−Other)", "LLM (Self−Other)")
names(diffdiff_sem.2) <- names(diffdiff_means.2)

bp <- barplot(diffdiff_means.2,
              ylim = c(0,.2),
              col = "grey40",
              ylab = "ΔSelf − ΔOther",
              main = "Diff of Deltas (Exp. 2)")

mtext("F",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp,
       diffdiff_means.2 - diffdiff_sem.2,
       bp,
       diffdiff_means.2 + diffdiff_sem.2,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)


# Correct/intuitive for Exp. 1============================

# Means___________________________________________________

layout(matrix(c(
  1,2,
  3,4,
  5,5
), byrow = TRUE, nrow = 3))

par(oma = c(2,2,3,2))

# correct ------------------------------------------------
setwd('ADD PATH')
d <- read.csv('output_MIX.HU.L2_lab.csv', header=TRUE, sep=',', na.strings = c('-999', '-999.00')); head(d)
d <- d[d$Dataset!='Llama2',]

# standard acc == correct/intuitive
d.1 <- d[d$StandardAcc_lab=="correct",]


# Aggregate means by Dataset and Type (CRT vs Control)
exp1_means_df.1 <- aggregate(cbind(StandardConfidence, StandardOpinion,
                                 ControlConfidence, ControlOpinion) ~ Dataset,
                           data = d.1,
                           FUN = mean,
                           na.rm = TRUE)

# Manually reorder the columns into the original layout

# Extract numeric columns
numeric_means.1 <- exp1_means_df.1[, c("StandardConfidence", "StandardOpinion",
                                   "ControlConfidence", "ControlOpinion")]

# Create the 2x4 matrix exactly matching the original layout
exp1_means.1 <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT / Standard (Self/Other)
exp1_means.1[1, ] <- c(numeric_means.1$StandardConfidence[1], numeric_means.1$StandardOpinion[1],
                     numeric_means.1$StandardConfidence[2], numeric_means.1$StandardOpinion[2])

# Row 2 = Control (Self/Other)
exp1_means.1[2, ] <- c(numeric_means.1$ControlConfidence[1], numeric_means.1$ControlOpinion[1],
                     numeric_means.1$ControlConfidence[2], numeric_means.1$ControlOpinion[2])

exp1_means.1

# SEM function
sem <- function(x) {
  sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x)))
}

# Aggregate SEM by Dataset
sem_df.1 <- aggregate(cbind(StandardConfidence, StandardOpinion,
                          ControlConfidence, ControlOpinion) ~ Dataset,
                    data = d.1,
                    FUN = sem)

# Manually reorder into the same 2x4 layout as the means
sem_matrix.1 <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT/Standard (Self/Other)
sem_matrix.1[1, ] <- c(sem_df.1$StandardConfidence[1], sem_df.1$StandardOpinion[1],
                     sem_df.1$StandardConfidence[2], sem_df.1$StandardOpinion[2])

# Row 2 = Control (Self/Other)
sem_matrix.1[2, ] <- c(sem_df.1$ControlConfidence[1], sem_df.1$ControlOpinion[1],
                     sem_df.1$ControlConfidence[2], sem_df.1$ControlOpinion[2])

exp1_sem.1 <- sem_matrix.1


new_order <- c(1,2,3,4)
exp1_means.1 <- exp1_means.1[, new_order]
exp1_sem.1   <- exp1_sem.1[, new_order]

rownames(exp1_means.1) <- c("CRT","Control")
rownames(exp1_sem.1) <- rownames(exp1_means.1)

colnames(exp1_means.1) <- c("Self (Hu)","Other (Hu)","Self (LLM)","Other (LLM)")
colnames(exp1_sem.1) <- colnames(exp1_means.1)

# Plot A
# CRT and Control are both blue; Control is distinguished by hatching

# Plot A
bp.1 <- barplot(exp1_means.1,
                beside = TRUE,
                col = c("lightblue","lightblue","lightblue","lightblue",
                        "blue", "blue", "blue", "blue"),
                ylim = c(0, 1),
                ylab = "Mean Rating",
                legend.text = FALSE,
                main = "Experiment 1 (Correct)")

# Add hatch marks to Control bars while retaining solid fill
barplot(exp1_means.1,
        beside = TRUE,
        col = NA,
        density = c(0, 20),
        angle = 45,
        add = TRUE,
        axes = FALSE)

mtext("A",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

legend("topright",
       inset = c(0, -0.1),
       xpd = NA,
       horiz = TRUE,
       bty = "n",
       fill = c("lightblue", "blue"),
       density = c(0, 20),
       angle = c(45, 45),
       legend = c("CRT", "Control"),
       xjust = 0.5)



# Error bars
arrows(bp.1,
       exp1_means.1 - exp1_sem.1,
       bp.1,
       exp1_means.1 + exp1_sem.1,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)
# Incorrect responses ----------------------------------------------

setwd('ADD PATH')
d <- read.csv('output_MIX.HU.L2_lab.csv', header=TRUE, sep=',', na.strings = c('-999', '-999.00'))
d <- d[d$Dataset != 'Llama2',]

# standard acc == intuitive
d.2 <- d[d$StandardAcc_lab == "intuitive",]

# Aggregate means by Dataset and Type (CRT vs Control)
exp1_means_df.2 <- aggregate(cbind(StandardConfidence, StandardOpinion,
                                   ControlConfidence, ControlOpinion) ~ Dataset,
                             data = d.2,
                             FUN = mean,
                             na.rm = TRUE)

# Extract numeric columns
numeric_means.2 <- exp1_means_df.2[, c("StandardConfidence", "StandardOpinion",
                                       "ControlConfidence", "ControlOpinion")]

# Create the 2x4 matrix exactly matching the original layout
exp1_means.2 <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT / Standard (Self/Other)
exp1_means.2[1, ] <- c(numeric_means.2$StandardConfidence[1], numeric_means.2$StandardOpinion[1],
                       numeric_means.2$StandardConfidence[2], numeric_means.2$StandardOpinion[2])

# Row 2 = Control (Self/Other)
exp1_means.2[2, ] <- c(numeric_means.2$ControlConfidence[1], numeric_means.2$ControlOpinion[1],
                       numeric_means.2$ControlConfidence[2], numeric_means.2$ControlOpinion[2])

# SEM function
sem <- function(x) sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x)))

# Aggregate SEM by Dataset
sem_df.2 <- aggregate(cbind(StandardConfidence, StandardOpinion,
                            ControlConfidence, ControlOpinion) ~ Dataset,
                      data = d.2,
                      FUN = sem)

# Manually reorder into the same 2x4 layout as the means
sem_matrix.2 <- matrix(nrow = 2, ncol = 4)

# Row 1 = CRT/Standard (Self/Other)
sem_matrix.2[1, ] <- c(sem_df.2$StandardConfidence[1], sem_df.2$StandardOpinion[1],
                       sem_df.2$StandardConfidence[2], sem_df.2$StandardOpinion[2])

# Row 2 = Control (Self/Other)
sem_matrix.2[2, ] <- c(sem_df.2$ControlConfidence[1], sem_df.2$ControlOpinion[1],
                       sem_df.2$ControlConfidence[2], sem_df.2$ControlOpinion[2])

exp1_sem.2 <- sem_matrix.2

# Reorder columns
new_order <- c(1, 2, 3, 4)
exp1_means.2 <- exp1_means.2[, new_order]
exp1_sem.2   <- exp1_sem.2[, new_order]

# Assign row and column names
rownames(exp1_means.2) <- c("CRT", "Control")
rownames(exp1_sem.2)   <- rownames(exp1_means.2)
colnames(exp1_means.2) <- c("Self (Hu)", "Other (Hu)", "Self (LLM)", "Other (LLM)")
colnames(exp1_sem.2)   <- colnames(exp1_means.2)

# Plot
bp.2 <- barplot(exp1_means.2,
                beside = TRUE,
                col = c("pink","pink","pink","pink", 
                        "red", "red", "red", "red"),
                ylim = c(0, 1),
                ylab = "Mean Rating",
                legend.text = FALSE,
                main = "Experiment 1 (Intuitive)")

# Add hatch marks to Control bars while retaining solid fill
barplot(exp1_means.2,
        beside = TRUE,
        col = NA,
        density = c(0, 20),
        angle = 45,
        add = TRUE,
        axes = FALSE)

mtext("B",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)


legend("topright",
       inset = c(0, -0.1),
       xpd = NA,
       horiz = TRUE,
       bty = "n",
       fill = c("pink", "red"),
       density = c(0, 20),
       angle = c(45, 45),
       legend = c("CRT", "Control"),
       xjust = 0.5)


# Error bars
arrows(bp.2,
       exp1_means.2 - exp1_sem.2,
       bp.2,
       exp1_means.2 + exp1_sem.2,
       angle = 90,
       code = 3,
       length = 0.05,
       lwd=3)

# -------------------------------
# Delta Plots (CRT − Control)
# -------------------------------

# --- Correct responses (.1) ---
crt.1 <- as.numeric(exp1_means.1[1, ])
control.1 <- as.numeric(exp1_means.1[2, ])

crt_sem.1 <- as.numeric(exp1_sem.1[1, ])
control_sem.1 <- as.numeric(exp1_sem.1[2, ])

diff_means.1 <- crt.1 - control.1
diff_sem.1 <- sqrt(crt_sem.1^2 + control_sem.1^2)

diff_means.1 <- diff_means.1[new_order]
diff_sem.1   <- diff_sem.1[new_order]

names(diff_means.1) <- c("Self (Hu)", "Other (Hu)", "Self (LLM)", "Other (LLM)")
names(diff_sem.1)   <- names(diff_means.1)

bp.1 <- barplot(diff_means.1,
                ylim = c(-0.2, 0),
                col = c("lightblue","lightblue","blue", "blue"),
                ylab = "CRT − Control",
                main = "Delta (Exp. 1) – Correct")


mtext("C",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp.1,
       diff_means.1 - diff_sem.1,
       bp.1,
       diff_means.1 + diff_sem.1,
       angle = 90,
       code = 3,
       length = 0.05,
       lwd=3)


# --- Incorrect responses (.2) ---
crt.2 <- as.numeric(exp1_means.2[1, ])
control.2 <- as.numeric(exp1_means.2[2, ])

crt_sem.2 <- as.numeric(exp1_sem.2[1, ])
control_sem.2 <- as.numeric(exp1_sem.2[2, ])

diff_means.2 <- crt.2 - control.2
diff_sem.2 <- sqrt(crt_sem.2^2 + control_sem.2^2)

diff_means.2 <- diff_means.2[new_order]
diff_sem.2   <- diff_sem.2[new_order]

names(diff_means.2) <- c("Self (Hu)", "Other (Hu)", "Self (LLM)", "Other (LLM)")
names(diff_sem.2)   <- names(diff_means.2)

bp.2 <- barplot(diff_means.2,
                ylim = c(-0.2, 0),
                col = c("pink", "pink", "red", "red"),
                ylab = "CRT − Control",
                main = "Delta (Exp. 1) – Intuitive")



mtext("D",
      side = 3,
      line = 4,
      adj = -.1,
      font = 2,
      cex = 1.2)

arrows(bp.2,
       diff_means.2 - diff_sem.2,
       bp.2,
       diff_means.2 + diff_sem.2,
       angle = 90,
       code = 3,
       length = 0.05,
       lwd=3)

# -------------------------------
# Difference of Deltas (Exp 1)
# -------------------------------

# --- Correct responses (.1) ---
diffdiff_means.1 <- c(
  diff_means.1["Self (Hu)"] - diff_means.1["Other (Hu)"],
  diff_means.1["Self (LLM)"] - diff_means.1["Other (LLM)"]
)

diffdiff_sem.1 <- c(
  sqrt(diff_sem.1["Self (Hu)"]^2 + diff_sem.1["Other (Hu)"]^2),
  sqrt(diff_sem.1["Self (LLM)"]^2 + diff_sem.1["Other (LLM)"]^2)
)

names(diffdiff_means.1) <- c("Hu (Self−Other)", "LLM (Self−Other)")
names(diffdiff_sem.1) <- names(diffdiff_means.1)


# --- Incorrect responses (.2) ---
diffdiff_means.2 <- c(
  diff_means.2["Self (Hu)"] - diff_means.2["Other (Hu)"],
  diff_means.2["Self (LLM)"] - diff_means.2["Other (LLM)"]
)

diffdiff_sem.2 <- c(
  sqrt(diff_sem.2["Self (Hu)"]^2 + diff_sem.2["Other (Hu)"]^2),
  sqrt(diff_sem.2["Self (LLM)"]^2 + diff_sem.2["Other (LLM)"]^2)
)

names(diffdiff_means.2) <- c("Hu (Self−Other)", "LLM (Self−Other)")
names(diffdiff_sem.2) <- names(diffdiff_means.2)

combined <- rbind(
  diffdiff_means.1,
  diffdiff_means_exp.1,
  diffdiff_means.2
)

rownames(combined) <- c("Correct", "All", "Intuitive")

bp <- barplot(
  combined,
  beside = TRUE,
  names.arg = rep("", ncol(combined)),
  col = c("lightblue", "#8E6F8A", "pink","blue", "purple", "red"),
  ylim = c(-.05,.2),   
  ylab = "ΔSelf − ΔOther",
  main = "(CRT-Control, Self-Other)",
)

legend("topright",
       inset = c(0, -0.1),
       xpd = NA,
       horiz = TRUE,
       bty = "n",
       fill = c("lightblue", "#8E6F8A", "pink","blue", "purple", "red"),
       legend = c("Correct Hu","All Hu", "Intuitive Hu","Correct LLM","All LLM", "Intuitive LLM"),
       xjust = 0.5)

text(bp,
     par("usr")[3] - 0.01,
     labels = c(
       "Hu-Correct",
       "Hu-All",
       "Hu-Intuitive",
       "LLM-Correct",
       "LLM-All",
       "LLM-Intuitive"
     ),
     # srt = 45,
     # adj = 1,
     xpd = TRUE)

mtext("E",
      side = 3,
      line = 4,
      adj = -.035,
      font = 2,
      cex = 1.2)

# legend("topright",
#        inset = c(0, -0.25),
#        xpd = NA,
#        horiz = TRUE,
#        fill = c("grey40","grey70", "grey20"),
#        legend = c("Correct", "All","Intuitive"),
#        bty = "n",
#        xjust = 0.5)

combined_sem <- rbind(
  diffdiff_sem.1,
  diffdiff_sem_exp.1,
  diffdiff_sem.2
)

arrows(bp,
       combined - combined_sem,
       bp,
       combined + combined_sem,
       angle = 90,
       code = 3,
       length = .05,
       lwd=3)


# Statistics

setwd('ADD PATH')
d <- read.csv('output_MIX.HU.L2_lab.csv', header=TRUE, sep=',', na.strings = c('-999', '-999.00'))
d <- d[d$Dataset != 'Llama2',]

# Humans ===================================

# Test 1: Correct reasoners only.  Is the diff-in-diffs different from 0?

d.hu.correct <- subset(
  d,
  Dataset == "Human" &
    StandardAcc_lab == "correct"
)

dd.hu.correct <-
  (d.hu.correct$StandardConfidence - d.hu.correct$ControlConfidence) -
  (d.hu.correct$StandardOpinion    - d.hu.correct$ControlOpinion)

t.test(dd.hu.correct, mu = 0)


# Test 2: intuitive reasoners only.  Is the diff-in-diffs different from 0?

d.hu.intuitive <- subset(
  d,
  Dataset == "Human" &
    StandardAcc_lab == "intuitive"
)

dd.hu.intuitive <-
  (d.hu.intuitive$StandardConfidence - d.hu.intuitive$ControlConfidence) -
  (d.hu.intuitive$StandardOpinion    - d.hu.intuitive$ControlOpinion)

t.test(dd.hu.intuitive, mu = 0)

# Test 3: All humans.  Is the diff-in-diffs different from 0?

d.hu.all <- subset(d, Dataset == "Human")

dd.hu.all <-
  (d.hu.all$StandardConfidence - d.hu.all$ControlConfidence) -
  (d.hu.all$StandardOpinion    - d.hu.all$ControlOpinion)

t.test(dd.hu.all, mu = 0)

# Test 4: correct vs. intuitive humans

t.test(dd.hu.correct,
       dd.hu.intuitive,
       var.equal = FALSE)

# LLMS ===========================================================

# Test 1: Correct reasoners only.  Is the diff-in-diffs different from 0?

d.mix.correct <- subset(
  d,
  Dataset == "MIXTRAL" &
    StandardAcc_lab == "correct"
)

dd.mix.correct <-
  (d.mix.correct$StandardConfidence - d.mix.correct$ControlConfidence) -
  (d.mix.correct$StandardOpinion    - d.mix.correct$ControlOpinion)

t.test(dd.mix.correct, mu = 0)


# Test 2: intuitive reasoners only.  Is the diff-in-diffs different from 0?

d.mix.intuitive <- subset(
  d,
  Dataset == "MIXTRAL" &
    StandardAcc_lab == "intuitive"
)

dd.mix.intuitive <-
  (d.mix.intuitive$StandardConfidence - d.mix.intuitive$ControlConfidence) -
  (d.mix.intuitive$StandardOpinion    - d.mix.intuitive$ControlOpinion)

t.test(dd.mix.intuitive, mu = 0)

# Test 3: All humans.  Is the diff-in-diffs different from 0?

d.mix.all <- subset(d, Dataset == "MIXTRAL")

dd.mix.all <-
  (d.mix.all$StandardConfidence - d.mix.all$ControlConfidence) -
  (d.mix.all$StandardOpinion    - d.mix.all$ControlOpinion)

t.test(dd.mix.all, mu = 0)

# Test 4: correct vs. intuitive humans

t.test(dd.mix.correct,
       dd.mix.intuitive,
       var.equal = FALSE)


# ============================================================
# Experiment 2: CRT and Numeracy
# A = Humans
# B = LLMs
# ============================================================

# Load Experiment 2 data
setwd('SET WD')

d <- read.csv(
  'B&P_Human&LLM.csv',
  header = TRUE,
  sep = ','
)

# Set up 3 plots horizontally
par(mfrow = c(1,2),
    mar = c(5, 4, 3, 1),
    oma = c(0, 0, 0, 0))

# Check dataset labels
unique(d$Dataset)
table(d$Dataset)

d$CRT_prop_correct <- d$CRT_avg_corr / 5
d$Num_prop_correct <- d$Num_avg_corr / 5

# ============================================================
# Experiment 2: Proportion Correct
# A = Humans
# B = LLMs
# ============================================================

exp2_prop_means <- aggregate(
  cbind(CRT_prop_correct, Num_prop_correct) ~ Dataset,
  data = d,
  FUN = mean,
  na.rm = TRUE
)

exp2_prop_sem <- aggregate(
  cbind(CRT_prop_correct, Num_prop_correct) ~ Dataset,
  data = d,
  FUN = sem
)

# Extract Human values
human_means <- c(
  exp2_prop_means$CRT_prop_correct[exp2_prop_means$Dataset == "Human"],
  exp2_prop_means$Num_prop_correct[exp2_prop_means$Dataset == "Human"]
)

human_sem <- c(
  exp2_prop_sem$CRT_prop_correct[exp2_prop_sem$Dataset == "Human"],
  exp2_prop_sem$Num_prop_correct[exp2_prop_sem$Dataset == "Human"]
)

# Extract LLM values
llm_means <- c(
  exp2_prop_means$CRT_prop_correct[exp2_prop_means$Dataset == "LLM"],
  exp2_prop_means$Num_prop_correct[exp2_prop_means$Dataset == "LLM"]
)

llm_sem <- c(
  exp2_prop_sem$CRT_prop_correct[exp2_prop_sem$Dataset == "LLM"],
  exp2_prop_sem$Num_prop_correct[exp2_prop_sem$Dataset == "LLM"]
)


# -----------------------------
# Panel A: Humans
# -----------------------------

bp.A <- barplot(
  human_means,
  names.arg = c("CRT", "Numeracy"),
  ylim = c(0, 1),
  col = c("blue", "lightblue"),
  ylab = "Proportion Correct",
  main = "Human"
)

arrows(
  bp.A,
  human_means - human_sem,
  bp.A,
  human_means + human_sem,
  angle = 90,
  code = 3,
  length = 0.05,
  lwd=3
)

mtext("A", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)


# -----------------------------
# Panel B: LLMs
# -----------------------------

bp.B <- barplot(
  llm_means,
  names.arg = c("CRT", "Numeracy"),
  ylim = c(0, 1),
  col = c("blue", "lightblue"),
  ylab = "",
  main = "LLM"
)

arrows(
  bp.B,
  llm_means - llm_sem,
  bp.B,
  llm_means + llm_sem,
  angle = 90,
  code = 3,
  length = 0.05,
  lwd=3
)

mtext("B", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)

# ---------------------------------------
# Experiment 2: Human and LLM plots
# ---------------------------------------

par(mfrow = c(1, 2),
    mar = c(5, 4, 4, 2))


# ---------------------------------------
# Panel A: Humans
# ---------------------------------------

exp2_means.hu <- exp2_means[, c("Self (Hu)", "Other (Hu)")]
exp2_sem.hu   <- exp2_sem[, c("Self (Hu)", "Other (Hu)")]

bp.hu <- barplot(
  exp2_means.hu,
  beside = TRUE,
  col = c("blue", "lightblue"),
  ylim = c(0, 1),
  ylab = "Mean Rating",
  names.arg = c("Self", "Other"),
  legend.text = FALSE,
  main = "Human"
)

mtext("A", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)

legend("topright",
       inset = c(0, -.3),
       xpd = NA,
       bty = "n",
       fill = c("blue", "lightblue"),
       legend = c("Self", "Other"),
       xjust = 0.5)

arrows(
  bp.hu,
  exp2_means.hu - exp2_sem.hu,
  bp.hu,
  exp2_means.hu + exp2_sem.hu,
  angle = 90,
  code = 3,
  length = .05,
  lwd=3
)

legend("topleft",
       bty = "n",
       fill = c("blue", "lightblue"),
       legend = c("CRT", "Numeracy"),
       xjust = 0.5)


# ---------------------------------------
# Panel B: LLMs
# ---------------------------------------

exp2_means.llm <- exp2_means[, c("Self (LLM)", "Other (LLM)")]
exp2_sem.llm   <- exp2_sem[, c("Self (LLM)", "Other (LLM)")]

bp.llm <- barplot(
  exp2_means.llm,
  beside = TRUE,
  col = c("blue", "lightblue"),
  ylim = c(0, 1),
  ylab = "Mean Rating",
  names.arg = c("Self", "Other"),
  legend.text = FALSE,
  main = "LLM"
)

mtext("B", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)


arrows(
  bp.llm,
  exp2_means.llm - exp2_sem.llm,
  bp.llm,
  exp2_means.llm + exp2_sem.llm,
  angle = 90,
  code = 3,
  length = .05,
  lwd=3
)

par(mfrow = c(1, 1))


# overestimates plots =========================================================

# ---------------------------------------
# Observed Overestimates: Humans vs. LLMs
# ---------------------------------------

# Human means and SEs
human_over_means <- c(
  1.263,
  1.161,
  -0.298,
  -0.075
)

human_over_se <- c(
  0.078,
  0.043,
  0.063,
  0.048
)


# LLM means and SEs
llm_over_means <- c(
  0.573,
  0.664,
  -0.402,
  -0.263
)

llm_over_se <- c(
  0.042,
  0.055,
  0.044,
  0.046
)


# ---------------------------------------
# Plot
# ---------------------------------------

par(mfrow = c(1, 2),
    mar = c(7, 4, 4, 2))


# ---------------------------------------
# Panel A: Humans
# ---------------------------------------

bp.A <- barplot(
  human_over_means,
  beside = TRUE,
  col = c("#4682B4", "#87CEEB",
          "#4682B4", "#87CEEB"),
  ylim = c(-0.5, 1.5),
  ylab = "Observed Overestimate",
  names.arg = FALSE,
  legend.text = FALSE,
  main = "Human"
)

# Add one label centered under each pair of bars
axis(
  1,
  at = c(mean(bp.A[1:2]), mean(bp.A[3:4])),
  labels = c("CRT", "Numeracy"),
  tick = FALSE,
  line = 0
)

# Zero line
abline(h = 0)

# Error bars
arrows(
  bp.A,
  human_over_means - human_over_se,
  bp.A,
  human_over_means + human_over_se,
  angle = 90,
  code = 3,
  length = .05,
  lwd=3
)

mtext("A", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)

legend(
  "topright",
  xpd = NA,
  bty = "n",
  fill = c("#4682B4", "#87CEEB"),
  legend = c("Self", "Other")
)


# ---------------------------------------
# Panel B: LLMs
# ---------------------------------------

bp.B <- barplot(
  llm_over_means,
  beside = TRUE,
  col = c("#4682B4", "#87CEEB",
          "#4682B4", "#87CEEB"),
  ylim = c(-0.5, 1.5),
  ylab = "",
  names.arg = FALSE,
  legend.text = FALSE,
  main = "LLM"
)

# Add one label centered under each pair of bars
axis(
  1,
  at = c(mean(bp.B[1:2]), mean(bp.B[3:4])),
  labels = c("CRT", "Numeracy"),
  tick = FALSE,
  line = 0
)

# Zero line
abline(h = 0)

# Error bars
arrows(
  bp.B,
  llm_over_means - llm_over_se,
  bp.B,
  llm_over_means + llm_over_se,
  angle = 90,
  code = 3,
  length = .05,
  lwd=3
)

mtext("B", side = 3, line = 1, adj = -0.1, font = 2, cex = 1.2)


par(mfrow = c(1, 1))


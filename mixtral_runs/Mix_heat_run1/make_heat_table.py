#!/usr/bin/env python3

import pandas as pd

count_per_temp = 40
temp_list = [0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.3, 1.6, 2.4, 3.2]
index_offset = 0

df = pd.read_csv('heat_base.csv')
df2 = pd.DataFrame({'temp':temp_list})
dfdup = pd.concat([df]*(count_per_temp//len(df)), ignore_index=True)
newdf = dfdup.merge(df2, how='cross')
newdf['Subject'] = newdf.index + index_offset
newdf.set_index('Subject', inplace=True)
newdf.to_csv('heat_input.csv', float_format='%g', index_label='Subject')


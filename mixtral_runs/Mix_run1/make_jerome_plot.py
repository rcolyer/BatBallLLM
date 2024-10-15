#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

df = pd.read_csv('output.csv')

ages = [18, 19, 20, 23, 25, 30, 36, 41, 100]

masks = [(df['Age'] >= a) & (df['Age'] < b) for a,b in zip(ages, ages[1:])]

male = df[df['Gender'] == 'Male']
female = df[df['Gender'] == 'Female']
data_male = male['StandardAcc']
data_female = female['StandardAcc']

ym = [np.mean(data_male[m]) for m in masks]
yf = [np.mean(data_female[m]) for m in masks]
plt.plot(ages[:-1], ym, label='male')
plt.plot(ages[:-1], yf, label='female')
plt.legend()
plt.title('runs8, uncorrected responses')
plt.show()


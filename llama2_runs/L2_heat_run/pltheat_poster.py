#!/usr/bin/env python3

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy as sp
import scipy.optimize

def StartFig(*args, **kwargs):
  fig = plt.figure(*args, **kwargs)
  plt.rcParams.update({'font.size': 18, 'text.usetex':True})
  return fig


def SaveFig(basename, setdir=None, store_setdir=['.']):
  import os
  if setdir is not None:
    store_setdir[0] = setdir

  if basename is None:
    return

  if os.sep in basename:
    pathname = basename
  else:
    pathname = os.path.join(store_setdir[0], basename)

  plt.savefig(pathname+'.png')
  plt.savefig(pathname+'.pdf')
  plt.show()
  plt.close()

def F(x, k, c):
  return 1-c*(1-np.exp(-k*x**2))


df = pd.read_csv('output.csv', index_col=0)
StartFig()
data = df[['StandardAcc', 'ControlAcc', 'temp']].groupby('temp').mean()
(std_k, std_c), _ = sp.optimize.curve_fit(F, data.index, data['StandardAcc'])
(con_k, con_c), _ = sp.optimize.curve_fit(F, data.index, data['ControlAcc'])
plt.plot(data.index, data['StandardAcc'], 'o', color='r', label='Standard Acc.')
fit_x = np.linspace(0, 3.2, 500)
plt.plot(fit_x, F(fit_x, std_k, std_c), color='r')
#plt.plot(fit_x, F(fit_x, std_k, std_c), color='r', label=f'$1 - {std_c:.2f} (1-e^{{-{std_k:.2f} T^2}})$')
plt.plot(data.index, data['ControlAcc'], 'x', color='b', label='Control Acc.')
plt.plot(fit_x, F(fit_x, con_k, con_c), color='b')
#plt.plot(fit_x, F(fit_x, con_k, con_c), color='b', label=f'$1 - {con_c:.2f} (1-e^{{-{con_k:.2f} T^2}})$')
plt.vlines(0.8, 0, 1, 'k', linestyles='dotted', label='Default Temp.')
plt.title('Accuracy vs Llama2 Temperature, 1a only')
plt.xlabel('Temperature')
plt.ylabel('Accuracy')
plt.legend()
plt.tight_layout()
SaveFig('accuracy_temp_poster')


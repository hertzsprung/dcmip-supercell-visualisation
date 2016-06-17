#!/usr/bin/env python3
from netCDF4 import Dataset
import numpy as np
import sys

udata = Dataset('tempest.163.r100.L40.interp_latlon.nonhydro.U.nc', mode='r')
vdata = Dataset('tempest.163.r100.L40.interp_latlon.nonhydro.V.nc', mode='r')
wdata = Dataset('tempest.163.r100.L40.interp_latlon.nonhydro.W.nc', mode='r')
outdir = '30'
time = udata.variables['time']
lat = udata.variables['lat']
lon = udata.variables['lon']
lev = udata.variables['z']
us = np.array(udata.variables['U'][:])
vs = np.array(vdata.variables['V'][:])
ws = np.array(wdata.variables['W'][:])

c = 0

for t in range(len(time)):
    with open(outdir + '/wind' + str(t).zfill(3) + '.dat', 'w') as f:
        for i in range(len(lat)):
            for j in range(len(lon)):
                c += 1
                if c % 32 == 0:
                    u = us[t][10][i][j]
                    v = vs[t][10][i][j]
                    w = ws[t][10][i][j]
                    print(lat[i], lon[j], lev[10], u, v, w, file=f)

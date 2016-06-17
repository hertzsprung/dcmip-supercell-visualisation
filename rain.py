#!/usr/bin/env python3
from netCDF4 import Dataset
import numpy as np
import sys

data = Dataset(sys.argv[1], mode='r')
outdir = sys.argv[2]
field = sys.argv[3]
tol = float(sys.argv[4])
time = data.variables['time']
lat = data.variables['lat']
lon = data.variables['lon']
lev = data.variables['z']
Qr = np.array(data.variables[field][:])

for t in range(len(time)):
    with open(outdir + '/' + field + str(t).zfill(3) + '.dat', 'w') as f:
        for i in range(len(lat)):
            for j in range(len(lon)):
                for k in range(len(lev)):
                    rain = Qr[t][k][i][j]
                    if rain > tol:
                        print(lat[i], lon[j], lev[k], rain, file=f)

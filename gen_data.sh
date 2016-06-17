#!/bin/bash
set -e

j=40

for f in 30/Qr*.dat; do
	TIME=$(echo $f | sed -re 's#30/Qr([0-9]+).dat#\1#')
	echo $TIME
	j=$(( ($j + 1) % 360 ))
	TIME=$TIME VIEW=$j gnuplot5 -e "set output '30/rain$TIME.png'; load 'rain.plt'"
done
convert -delay 50 -loop 0 30/rain*.png rain.gif

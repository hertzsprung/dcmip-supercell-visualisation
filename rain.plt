set terminal pngcairo nocrop enhanced size 800,600
 #set output 'rain.png'
#set terminal wxt
set dummy u, v
set angles degrees
unset key
set parametric
set view 30, `echo $VIEW`, 0.8, 1.2
#set samples 32, 32
#set isosamples 32, 32
#set mapping spherical
set hidden3d defaults
set ticslevel 0
#set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
#set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
#set dgrid3d 200

unset border
#unset xtics
#unset ytics
#unset ztics
set lmargin 0
set rmargin 0
set bmargin 0
set tmargin 0

set xrange [-30:30]
set yrange [-30:30]
set zrange [0:20e3]
set cbrange [-0.005:0.01]
set palette defined ( \
-3.5 '#333333',\
0 '#FFFFD9',\
1 '#EDF8B1',\
2 '#C7E9B4',\
3 '#7FCDBB',\
4 '#41B6C4',\
5 '#1D91C0',\
6 '#225EA8',\
7 '#0C2C84' )

set xlabel "lon"
set ylabel "lat"

splot "`echo 30/Qc$TIME.dat`" u 2:1:3:(-$4) with points palette pt 7, \
 "`echo 30/Qr$TIME.dat`" u 2:1:3:4 with points palette pt 7, \
 "`echo 30/wind$TIME.dat`" u 2:1:3:($5/5):($4/5):($6*1e3) with vectors head size 4,10 lw 1.5 lc -1

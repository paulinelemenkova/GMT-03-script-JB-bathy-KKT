#!/bin/sh
# Purpose: bathymetry contour from the ETOPO5 grid 5 arc minute global data set (here: Kuril-Kamchatka area)
# GMT modules: grdcut, grdinfo, grdcontour, psbasemap, pstext, logo
# Step-1.
gmt grdcut earth_relief_05m.grd -R140/170/40/60 -Gkkt_relief.nc -V
gmt grdinfo @kkt_relief.nc
# Step-2.
gmt grdcontour @kkt_relief.nc -R140/170/40/60 -JB155/50/45/55/6.0i -C500 -A1000 -S4 -T+d15p/3p \
	--MAP_GRID_PEN_PRIMARY=thinnest \
	-P -K > GMT_conic_bathyKKT.ps
# Step-3.
gmt psbasemap -R -J \
	--FORMAT_GEO_MAP=dddF \
	--MAP_FRAME_PEN=dimgray \
	--MAP_FRAME_WIDTH=0.08c \
	--MAP_TICK_PEN_PRIMARY=thinner,dimgray \
	--FONT_TITLE=14p,Palatino-Roman,black \
    --FONT_ANNOT_PRIMARY=7p,Helvetica,darkblue \
    --FONT_LABEL=7p,Helvetica,black \
	-Tdg144/57.5+w0.5c+f2+l \
	-Lx5.1i/-0.5i+c50+w1000k+l"Conic equal-area Albers projection. Scale at 50\232N, km"+f \
	-Bxg4f2a5 -Byg2f1a2 \
	-B+t"Bathymetric contour of the Kuril-Kamchatka Trench area" -U -O -K >> GMT_conic_bathyKKT.ps
# Step-4.
gmt logo -R -J -Dx6.5/-2.2+o0.1i/0.1i+w2c -O -K >> GMT_conic_bathyKKT.ps
# Step-5.
gmt pstext -R0/8.5/0/11 -Jx1i -F+f7p,Helvetica,dimgray+jCB -N -O -K >> GMT_conic_bathyKKT.ps << END
0.34 -0.5 Bathymetry: ETOPO 5 arc min Global Relief Model
END
gmt pstext -R -J -F+f7p,Helvetica,dimgray+jCB -N -O >> GMT_conic_bathyKKT.ps << EOF
4.8 -0.7 Standard paralles at 45\232 and 55\232 N
EOF

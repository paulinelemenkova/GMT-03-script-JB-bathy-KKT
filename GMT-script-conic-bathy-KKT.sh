#!/bin/sh
# Purpose: bathymetry contour from the ETOPO5 grid 5 arc minute global data set (here: Kuril-Kamchatka area)
# GMT modules: grdcut, grdinfo, grdcontour, psbasemap, logo
gmt grdcut earth_relief_05m.grd -R140/170/40/60 -Gkkt_relief.nc -V
gmt grdinfo @kkt_relief.nc
gmt grdcontour @kkt_relief.nc -R140/170/40/60 -JB155/50/45/55/6.0i -C500 -A1000 -S4 -T+d15p/3p \
	--MAP_GRID_PEN_PRIMARY=thinnest \
	-P -K > GMT_conic_bathyKKT.ps
gmt psbasemap -R -J \
	--FORMAT_GEO_MAP=dddF \
	--MAP_FRAME_PEN=dimgray \
	--MAP_FRAME_WIDTH=0.1c \
	--MAP_TICK_PEN_PRIMARY=thinner,dimgray \
	--FONT_TITLE=12p,Palatino-Roman,black \
	--FONT_ANNOT_PRIMARY=7p,Helvetica,dimgray \
	--FONT_LABEL=7p,Helvetica,dimgray \
	-Tdg144/57+w0.5c+f2+l \
	-Lx5.3i/-0.5i+c50+w400k+l"Conic equal-area Albers projection. Scale, km"+f \
	-Bxg4f2a4 -Byg4f2a4 \
	-B+t"Bathymetry contour of the Kuril-Kamchatka Trench based on the ETOPO1 grid 5 arc min Global Relief Model" -O -K >> GMT_conic_bathyKKT.ps
echo 'This is the surface of cube' | gmt pstext -U -R -J \
	-F+f24p,Helvetica-Bold+jTL -O -K >> GMT_conic_bathyKKT.ps
gmt logo -R -J -Dx6.5/-2.2+o0.1i/0.1i+w2c -O >> GMT_conic_bathyKKT.ps

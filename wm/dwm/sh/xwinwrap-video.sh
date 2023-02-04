#!/bin/bash

killall -9 xwinwrap

xwinwrap -g 1920x1080 -ni -s -nf -b -un -ov -fdt -argb -- mpv -wid WID --ao=null --loop=inf --stop-screensaver=no --hwdec=vdpau /home/lius/Videos/mp4-wall/calling20221009.mp4

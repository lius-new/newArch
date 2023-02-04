#!/bin/bash

light=$(cat /sys/class/backlight/intel_backlight/brightness)
let light+=9600 
if [[ $light -le 96000 ]];then
    echo $light >  /sys/class/backlight/intel_backlight/brightness
    kill -36 $(pidof dwmblocks)
fi


#!/bin/bash

light=$(cat /sys/class/backlight/intel_backlight/brightness)
let light-=9600 
if [[ $light -ge 0 ]];then
    echo $light >  /sys/class/backlight/intel_backlight/brightness
    kill -36 $(pidof dwmblocks)
fi

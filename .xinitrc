#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -n "$failsafe" ]; then
 # twm &
 # xclock -geometry 50x50-1+1 &
 # xterm -geometry 80x50+494+51 &
 # xterm -geometry 80x20+494-0 &
 # exec xterm -geometry 80x66+0+0 -name login
 echo 'no thing'
else
 exec $command
fi

setxkbmap -option ctrl:nocaps

for i in $(ps -auf | grep clash | awk '{print $2}');do kill -9 $i;done
nohup /usr/bin/clash -d /home/lius/.config/clash/ > /dev/null 2>&1 &

feh --bg-fill --randomize --no-fehbg /home/lius/Pictures/bg-walls/*

picom -CGb --experimental-backends

fcitx

# /home/lius/.config/wm/dwm/sh/xwinwrap-video.sh &

dwmblocks &

exec dbus-launch --sh-syntax --exit-with-session dwm

# exec dwm &

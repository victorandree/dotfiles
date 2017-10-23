#! /bin/bash
xrdb -load ~/.Xresources
xset s off
xset -dpms
xset s noblank

xset r rate 200 20

wal -R

setxkbmap -layout us -variant mac -option -option lv3:ralt_alt -option lv3:lalt_switch

exec i3


#! /bin/bash
xrdb -load ~/.Xresources

# No screensaver
xset s off

# Prevents screen from turning off (???)
xset -dpms

# Dont blank screen 
xset s noblank

# Repetition rate (waits 200ms and repeats 20Hz)
xset r rate 200 20

# Set wallpaper using wal
wal -R

# We are doomed to using US layouts, but it's ok because the Mac US layout has
# decent support for entering special characters. But, we don't want to use
# AltGr to enter special characters (that's the Meta key) -- we want to use
# regular Alt. So Cancel the effects of ralt_switch in us-mac and pick
# left Alt.
setxkbmap -layout us -variant mac \
    -option \
    -option lv3:ralt_alt \
    -option lv3:lalt_switch

compton -b
exec i3


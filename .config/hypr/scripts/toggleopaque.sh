#!/bin/bash

address=$(hyprctl activewindow -j | jq -r '.address')
class=$(hyprctl activewindow -j | jq -r '.initialClass')
 
if [ -z "$address" ] || [ "$address" == "null" ]; then
    exit 0
fi

state_file="/tmp/opaque_$address"

if [ -f "$state_file" ]; then
    rm "$state_file"
    hyprctl setprop active opaque 0
    if [ $class == "kitty" ]; then
	sed -i "s|0.8|1.0|g" ~/.config/kitty/kitty.conf
        killall -USR1 kitty
    fi
else
    touch "$state_file"
    hyprctl setprop active opaque 1
    if [ $class == "kitty" ]; then
	sed -i "s|1.0|0.8|g" ~/.config/kitty/kitty.conf
        killall -USR1 kitty
    fi
fi

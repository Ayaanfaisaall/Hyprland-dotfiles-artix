#!/bin/bash

# User se action argument receive karna (exit ya poweroff)
action=$1

if [ "$action" == "exit" ]; then
    prompt="Logout of Hyprland?"
    command="hyprctl dispatch 'hl.dsp.exit()'"
elif [ "$action" == "poweroff" ]; then
    prompt="Poweroff PC?"
    command="loginctl poweroff"
elif [ "$action" == "reboot" ]; then
    prompt="Restart PC?"
    command="loginctl reboot"
elif [ "$action" == "hyprlock" ]; then
    prompt="Lock Session?"
    command="hyprlock"
elif [ "$action" == "suspend" ]; then
    prompt="Suspend Session?"
    command="loginctl suspend && hyprlock"
else
    echo "Invalid action"
    exit 1
fi

choice=$(echo -e "No\nYes" | rofi -dmenu -i -p "$prompt" \
    -theme-str 'window {width: 250px; border-radius: 15px;} listview {lines: 2;}')

if [ "$choice" == "Yes" ]; then
    eval $command
fi

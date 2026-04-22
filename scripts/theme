#!/bin/bash

if [[ "$1" == "-ls" ]]; then
        timg --grid=7 --title="%b" "$HOME/dotfiles/.config/hypr/wallpapers/"* 2> /dev/null
	echo " "
        exit 0
fi

if [[ -z "$1" ]] || [[ ! "$1" =~ ^[0-9]+$ ]]; then
        echo "Use like: ./theme.sh <parameter(int)>"
        echo "OR: ./theme.sh -ls (to view)"
        exit 1
fi

no=$1

hyprppr="$HOME/.config/hypr/hyprpaper.conf"
hyprlck="$HOME/.config/hypr/hyprlock.conf"
wybr="$HOME/.config/waybar/config.jsonc"
sddm="/usr/share/sddm/themes/silent/configs/default.conf"

sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$hyprppr"
sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$hyprlck"
sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$sddm"

if [ $no -eq 14 ]; then
        sed -i "s/zaailW.svg/zaail.svg/g" "$wybr"
else
        sed -i "s/zaail.svg/zaailW.svg/g" "$wybr" &> /dev/null
fi


pkill waybar; waybar &> /dev/null &
pkill hyprpaper; hyprpaper &> /dev/null &

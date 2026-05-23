#!/bin/bash

a=0

if [[ $a -eq 1 ]]; then
    echo ""
    sed -i "3s/a=1/a=0/" ~/dotfiles/.config/waybar/scripts/control.sh
else
    echo "[control]" 
    sed -i "3s/a=0/a=1/" ~/dotfiles/.config/waybar/scripts/control.sh
fi

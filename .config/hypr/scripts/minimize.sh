#!/bin/bash

case $1 in
	amin)
		hyprctl dispatch movetoworkspacesilent special
		;;
	bmin)
		hyprctl dispatch togglespecialworkspace && hyprctl dispatch movetoworkspace e+0
		;;
esac


#!/bin/bash

case $1 in
	amin)
    hyprctl dispatch 'hl.dsp.window.move({ workspace = "special:magic", follow = false })'
		;;
	bmin)
    hyprctl dispatch 'hl.dsp.workspace.toggle_special("magic)' && hyprctl dispatch 'hl.dsp.window.move({ workspace = "e+0" })'
		;;
esac


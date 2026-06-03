#!/bin/bash

hyprctl dispatch 'hl.dsp.window.float()'
isfloating=$(hyprctl activewindow -j | jq '.floating')

if [ "$isfloating" = "true" ]; then
  hyprctl dispatch 'hl.dsp.window.resize({ x = 900, y = 600 })'
  hyprctl dispatch 'hl.dsp.window.center()'
fi

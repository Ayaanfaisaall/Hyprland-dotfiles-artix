#!/bin/bash

hyprctl dispatch togglefloating
isfloating=$(hyprctl activewindow -j | jq '.floating')

if [ "$isfloating" = "true" ]; then
	hyprctl dispatch resizeactive exact 900 600
	hyprctl dispatch centerwindow
fi

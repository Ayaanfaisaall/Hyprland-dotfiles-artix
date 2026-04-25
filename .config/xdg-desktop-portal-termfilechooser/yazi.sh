#!/bin/sh
set -e

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

# Launch Kitty with Yazi, passing the path to output the selection to "$out"
kitty --class yazi-filechooser -e yazi --chooser-file="$out" "$path"

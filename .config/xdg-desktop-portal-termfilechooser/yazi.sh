#!/bin/bash

set -e

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

if [ "$save" = "1" ]; then
    bsflnm=$(basename "$path")
    dldir="$HOME/Downloads"
    dummyfile="$dldir/$bsflnm"
    fileex=0

    # Create dummy file if it doesn't exist
    if [[ ! -f "$dummyfile" ]]; then
        touch "$dummyfile"
        fileex=1  
    fi 

    kitty --class yazi-filechooser -e yazi --chooser-file="$out" "$dummyfile"
    
    # Cleanup logic
    if [[ $fileex -eq 1 ]]; then 
        # FIXED: Replaced $dummy_file with $dummyfile
        if [ ! -s "$out" ] || [ "$(cat "$out")" != "$dummyfile" ]; then
             rm -f "$dummyfile"
        fi
    fi

else
    kitty --class yazi-filechooser -e yazi --chooser-file="$out" "$path"
fi

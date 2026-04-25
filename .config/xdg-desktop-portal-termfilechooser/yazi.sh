#!/bin/bash

set -e

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

if [ "$save" = "1" ]; then
    # 1. Basename nikal lo
    bsflnm=$(basename "$path")
    dl_dir="$HOME/Downloads"
    
    # 2. Bash ko use kr ky Downloads mai nai file bna lo
    dummy_file="$dl_dir/$bsflnm"
    touch "$dummy_file"
    
    # 3. Yazi mai wahi nai file direct open krlo
    kitty --class yazi-filechooser -e yazi --chooser-file="$out" "$dummy_file"
    
    # Safai: Agar tumne download cancel kr dia ya koi aur folder choose kia, 
    # to jo dummy file bash ne banayi thi usay chup chap delete kr do takay kachra jama na ho.
    if [ ! -s "$out" ] || [ "$(cat "$out")" != "$dummy_file" ]; then
         rm -f "$dummy_file"
    fi

else
    # 4. Normal file selector mode (Uploads/Folders ky liye)
    kitty --class yazi-filechooser -e yazi --chooser-file="$out" "$path"
fi

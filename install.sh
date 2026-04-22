#!/bin/bash

# Install Dependencies (for Artix)
source dependencies.sh

# Backup already existing configurations
echo "Backing up existing configurations (if any)" 
mkdir -p ~/.config/configbak
mv ~/.config/hypr ~/.config/waybar ~/.config/foot ~/.config/alacritty ~/.config/kitty ~/.config/rofi ~/.config/eww ~/.config/nwg-dock-hyprland ~/.config/dunst ~/.config/configbak/ 2>/dev/null

# Change Username to $HOME
sed -i "s|/home/ayaan|$HOME|" .config/hypr/hyprpaper.conf
sed -i "s|/home/ayaan|$HOME|" .config/waybar/config.jsonc
sed -i "s|/home/ayaan|$HOME|" .config/waybar/style.css
sed -i "s|/home/ayaan|$HOME|" .config/hypr/hyprlock.conf

# Deploy Configurations:
echo "Deploying the configurations"
cd .config
stow -t ~/.config .
cd ..

# Make Scripts Executable:
echo "Making scripts executable"
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh

# cp the scripts into bin
chmod +x scripts/*
sudo cp -p scripts/* /usr/local/bin/

# Reload Hyprland (if already loaded) or login into Hyprland
echo "Installation Successfull! Reload Hyprland (if already loaded) or login into Hyprland"

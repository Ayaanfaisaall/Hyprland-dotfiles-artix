#!/bin/bash

# Install Dependencies (for Fedora)
echo "Installing Dependencies..."
sudo dnf copr enable solopasha/hyprland -y
sudo dnf makecache
sudo dnf install -y $(cat dependencies.txt)

# Backup already existing configurations
echo "Backing up existing configurations (if any)" 
mkdir -p ~/.config/configbak
mv ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/eww ~/.config/nwg-dock-hyprland ~/.config/dunst ~/.config/configbak/ 2>/dev/null

# Deploy Configurations:
echo "Deploying the configurations"
cd .config
stow -t ~/.config .

# Make Scripts Executable:
echo "Making scripts executable"
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh

# Change Username to $HOME
sed -i "s|/home/ayaan/|$HOME|" $HOME/.config/hypr/hyprpaper.conf
sed -i "s|/home/ayaan/|$HOME|" $HOME/.config/waybar/config.jsonc
sed -i "s|/home/ayaan/|$HOME|" $HOME/.config/waybar/style.css
sed -i "s|/home/ayaan/|$HOME|" $HOME/.config/hypr/hyprlock.conf

# Reload Hyprland (if already loaded) or login into Hyprland
echo "Installation Successfull! Reload Hyprland (if already loaded) or login into Hyprland"

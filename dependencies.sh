#!/bin/bash

# Hyprland & Wayland Ecosystem Packages 

pacmanpkgs=(
    # Core dependencies
    "seatd"
    "seatd-runit"
    "dbus"
    "dbus-runit"

    # Core Wayland & Compositor
    "hyprland"
    "hyprlock"                  # Screen locker
    "hyprpaper"                 # Wallpaper daemon
    "sddm"
    "plymouth"
    "qt5-wayland"               # Qt5 Wayland support
    "qt6-wayland"               # Qt6 Wayland support
    "polkit-kde-agent"          # Authentication agent
    
    # Portals (Crucial for screen sharing & file picking)
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal"
    "xdg-desktop-portal-gtk"
    
    # Audio & Media Subsystem
    "pipewire"
    "wireplumber"
    "pipewire-alsa"
    "pipewire-pulse"
    "qt5-multimedia"            # Qt5 multimedia support
    "qt6-multimedia"            # Qt6 multimedia support
    "gst-plugins-good"          # GStreamer plugins
    "gst-plugins-bad"           # GStreamer plugins
    "gst-plugins-ugly"          # GStreamer plugins
    "gst-libav"                 # GStreamer libav integration
    
    # Utilities & Keybind Dependencies
    "wl-clipboard"              # Wayland clipboard
    "cliphist"                  # Clipboard history
    "grim"                      # Screenshot tool
    "slurp"                     # Screen region selector for grim
    "dunst"                     # Notification daemon
    "libnotify"                 # Notification library for dunst
    "pamixer"                   # CLI Audio control
    "playerctl"                 # CLI Media control
    "brightnessctl"             # CLI Backlight control
    "qt5-virtualkeyboard"       # Virtual keyboard (Qt5)
    "qt6-virtualkeyboard"       # Virtual keyboard (Qt6)
    
    # UI, App Launchers & Theming
    "rofi-wayland"              # App launcher
    "kitty"                     # Terminal (Hyprland's default fallback)
    "nwg-dock-hyprland"         # Dock
    "nwg-look"                  # GTK theme settings for Wayland
    "qt5ct"                     # Qt5 theme settings
    "qt6ct"                     # Qt6 theme settings
    "kvantum"                   # SVG-based theme engine for Qt
    "qt5-graphicaleffects"      # Qt5 graphical effects (often needed for SDDM themes)
    "qt5-quickcontrols2"        # Qt5 UI controls (often needed for SDDM themes)
    "qt5-svg"                   # Qt5 SVG rendering
    "ttf-jetbrains-mono-nerd"   # Nerd font for Waybar/Eww icons
    
    # Scripting dependencies (For Waybar/Eww/Hyprland IPC)
    "socat"
    "stow"
    "jq"
)

yaypkgs=(
    "waybar-git"                               # Status bar
    "eww"                                      # Advanced widget system
    "xdg-desktop-portal-termfilechooser-git"   # Terminal based file chooser portal
    "nwg-drawer"
    "graphite-gtk-theme"
    "bluez-tools"
    "timg" 
)

# --- Installation Execution ---

# 1. Arch Linux Support Setup (Crucial for Artix)
echo "[*] Setting up Arch Linux Repository Support..."
sudo pacman -S --needed artix-archlinux-support

# Populate Arch keys so pacman doesn't throw PGP signature errors
echo "[*] Populating Arch Linux Keys..."
sudo pacman-key --populate archlinux

# Note: Script assumes you have already added Arch repos ([extra], [core]) 
# to /etc/pacman.conf. If not, the script will pause here to remind you.
echo "-----------------------------------------------------------------"
echo "WARNING: Make sure Arch repos are added to your /etc/pacman.conf!"
echo "If you haven't done this, press Ctrl+C, edit pacman.conf, and rerun."
echo "-----------------------------------------------------------------"
sleep 3

# Sync databases after key population
sudo pacman -Sy

echo "[*] Installing official Hyprland packages via pacman..."
sudo pacman -S --needed "${pacmanpkgs[@]}"

echo "[*] Installing custom AUR Hyprland packages via yay..."
yay -S --needed "${yaypkgs[@]}"

echo "[+] Hyprland dependencies installation complete!"

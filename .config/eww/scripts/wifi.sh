#!/bin/bash

# Close Rofi if alredy open
if pgrep -x "rofi" > /dev/null; then
    pkill -x rofi
    exit 0
fi

# Define the Rofi command (added -show-icons to render the SVGs)
rofi_cmd="rofi -dmenu -i -show-icons -p"

# Path to your custom Wi-Fi icon
icon_path="/home/ayaan/.config/eww/assets/wifi2.svg"

# Check if Wi-Fi is currently disabled
status=$(nmcli -t -f WIFI g)

# Close the control_center as soon as wifi rofi opens
eww close control_center

if [ "$status" = "disabled" ]; then
    chosen=$(echo -e "Enable Wi-Fi\0icon\x1f$icon_path" | $rofi_cmd "Wi-Fi")
    if [ "$chosen" == "Enable Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Wi-Fi Enabled"
    fi
    exit 0
fi

# Grab the currently connected SSID
active_ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d':' -f2)

# Grab a clean list of available SSIDs, excluding the active one so it doesn't duplicate
if [ -n "$active_ssid" ]; then
    ssids=$(nmcli -t -f SSID dev wifi | grep -v "^$" | grep -v "^$active_ssid$" | sort | uniq)
else
    ssids=$(nmcli -t -f SSID dev wifi | grep -v "^$" | sort | uniq)
fi

# Build the Rofi menu list with icons
rofi_list="Disable Wi-Fi\0icon\x1f$icon_path\n"

# Add the connected network to the top with the indicator
if [ -n "$active_ssid" ]; then
    rofi_list+="${active_ssid} (connected)\0icon\x1f$icon_path\n"
fi

# Append the rest of the available SSIDs
while IFS= read -r ssid; do
    if [ -n "$ssid" ]; then
        rofi_list+="${ssid}\0icon\x1f$icon_path\n"
    fi
done <<< "$ssids"

# Show Rofi menu
chosen=$(echo -e "$rofi_list" | $rofi_cmd "Wi-Fi")

# Exit if nothing is chosen (e.g., pressed Escape)
if [ -z "$chosen" ]; then
    exit 0
fi

if [ "$chosen" == "Disable Wi-Fi" ]; then
    nmcli radio wifi off
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Wi-Fi Disabled"
    exit 0
fi

# Strip the " (connected)" indicator so nmcli can read the actual network name
clean_chosen=$(echo "$chosen" | sed 's/ (connected)//')

# If the user clicks the already connected network, just notify and exit
if [ "$clean_chosen" == "$active_ssid" ]; then
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Already connected to $active_ssid"
    exit 0
fi

# Check if the network is already saved (-Fx ensures exact line match)
saved=$(nmcli -t -f NAME connection show | grep -Fx "$clean_chosen")

if [ -n "$saved" ]; then
    # Connect to known network using device connect
    nmcli device wifi connect "$clean_chosen"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Connected to $clean_chosen"
else
    # Prompt for password for new network using Rofi's hidden input
    password=$(echo "" | rofi -dmenu -password -p "Password: ")
    if [ -n "$password" ]; then
        nmcli device wifi connect "$clean_chosen" password "$password"
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Connected to $clean_chosen"
    fi
fi

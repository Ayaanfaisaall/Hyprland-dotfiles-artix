#!/bin/bash

# Close Rofi if already open
if pgrep -x "rofi" > /dev/null; then
    pkill -x rofi
    exit 0
fi

# Rofi command mein bas -show-icons add kiya hai
rofi_cmd="rofi -dmenu -i -show-icons -p"
icon_path="/home/ayaan/.config/eww/assets/bluetooth2.svg"

# Check if Bluetooth is powered on
power_status=$(bluetoothctl show | grep "Powered: yes")

# Close the control_center as soon as wifi rofi opens
eww close control_center

if [ -z "$power_status" ]; then
    chosen=$(echo -e "Power On\0icon\x1f$icon_path" | $rofi_cmd "Bluetooth")
    if [ "$chosen" == "Power On" ]; then
        bluetoothctl power on
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Bluetooth Powered On"
    fi
    exit 0
fi

# Get lists of connected and all devices
connected_devices=$(bluetoothctl devices Connected | cut -d ' ' -f 3-)
all_devices=$(bluetoothctl devices | cut -d ' ' -f 3-)

# Start building the Rofi list
rofi_list="Power Off\0icon\x1f$icon_path\n"

# 1. Add connected devices at the top with the indicator
if [ -n "$connected_devices" ]; then
    while IFS= read -r dev; do
        if [ -n "$dev" ]; then
            rofi_list+="${dev} (connected)\0icon\x1f$icon_path\n"
        fi
    done <<< "$connected_devices"
fi

# 2. Add the rest of the available devices (skipping the already connected ones)
if [ -n "$all_devices" ]; then
    while IFS= read -r dev; do
        if [ -n "$dev" ] && ! echo "$connected_devices" | grep -q "^$dev$"; then
            rofi_list+="${dev}\0icon\x1f$icon_path\n"
        fi
    done <<< "$all_devices"
fi

# Show Rofi menu
chosen=$(echo -e "$rofi_list" | $rofi_cmd "Bluetooth")

# Exit if nothing is chosen
if [ -z "$chosen" ]; then
    exit 0
fi

if [ "$chosen" == "Power Off" ]; then
    bluetoothctl power off
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Bluetooth Powered Off"
    exit 0
fi

# Clean up the " (connected)" text so bluetoothctl can find the real device name
clean_chosen=$(echo "$chosen" | sed 's/ (connected)//')

# Get MAC address of the chosen device
mac=$(bluetoothctl devices | grep "$clean_chosen" | awk '{print $2}' | head -n 1)

if [ -z "$mac" ]; then
    exit 0
fi

# Check connection status to toggle it
info=$(bluetoothctl info "$mac")
if echo "$info" | grep -q "Connected: yes"; then
    bluetoothctl disconnect "$mac"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Disconnected: $clean_chosen"
else
    bluetoothctl connect "$mac"
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Connected: $clean_chosen"
fi

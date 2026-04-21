#!/bin/bash

case $1 in
    vol_up)
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-high "Volume: ${vol}%"
        ;;
    vol_down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-low "Volume: ${vol}%"
        ;;
    vol_mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '\[MUTED\]'; then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-muted "Speaker Mute"
        else
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-muted "Speaker Un-Mute"
        fi
        ;;
    mic_mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q '\[MUTED\]'; then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i microphone-sensitivity-muted "Mic Mute"
        else
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i microphone-sensitivity-muted "Mic Un-Mute"
        fi
        ;;
    br_up)
        brightnessctl set 10%+
        br=$(brightnessctl -m | awk -F, '{print $4}')
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i display-brightness "Brightness: ${br}"
        ;;
    br_down)
        current_br=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')

        if [ "$current_br" -ge 15 ]; then
            brightnessctl set 10%-
        fi

        br=$(brightnessctl -m | awk -F, '{print $4}')
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i display-brightness "Brightness: ${br}"
        ;;
esac

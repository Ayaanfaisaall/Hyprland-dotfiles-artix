---#################
---### AUTOSTART ###
---#################

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("dbus-run-session pipewire")
    hl.exec_cmd("wireplumber")
    hl.exec_cmd("pipewire-pulse")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-termfilechooser &")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Graphite-blue-Dark")
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("sudo plymouth quit")
end)

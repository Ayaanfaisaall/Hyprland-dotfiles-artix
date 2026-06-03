--##################
--## MY PROGRAMS ###
--##################

local confirm = "~/.config/hypr/scripts/confirm.sh"
local floating = "~/.config/hypr/scripts/floating.sh"
local fullscreen = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = \"fullscreen\" })'"
local minimize = "~/.config/hypr/scripts/minimize.sh"
local opaque = "~/.config/hypr/scripts/toggleopaque.sh"

--# Utilities
local clpbrd = "cliphist list| rofi -dmenu -p Clipboard| cliphist decode| wl-copy"
local clrclpbrd = "cliphist wipe && notify-send Clipboard Cleared"
local scrnsht = [[grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy -t image/png]]

--# UI & Layers
local bluetooth = "~/dotfiles/.config/eww/scripts/bluetooth.sh"
local ctrlcntr = "eww open --toggle control_center"
local control = "pkill -SIGRTMIN+10 waybar"
local dock = "nwg-dock-hyprland -d -i 30 -hd 0"
local dockshow = "killall -SIGUSR1 nwg-dock-hyprland"
local menu = "rofi -show drun"
local osd = "~/.config/hypr/scripts/osd.sh"
local rofi = "pkill rofi || rofi -show drun"
local wifi = "~/dotfiles/.config/eww/scripts/wifi.sh"

--# Apps

local browser = "brave"
local fileManager = "nautilus"
local gemini = "gtk-launch brave-gdfaincndogidkdcdkhapmbffkckdkhn-Default.desktop"
local terminal = "kitty"
local whatsapp = "gtk-launch brave-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop"
local fileman = "nautilus"
local inkscape = "gtk-launch org.inkscape.Inkscape.desktop"

return {
    confirm    = confirm,
    floating   = floating,
    fullscreen = fullscreen,
    minimize   = minimize,
    opaque     = opaque,
    clpbrd     = clpbrd,
    clrclpbrd  = clrclpbrd,
    scrnsht    = scrnsht,
    bluetooth  = bluetooth,
    ctrlcntr   = ctrlcntr,
    control    = control,
    dock       = dock,
    dockshow   = dockshow,
    menu       = menu,
    osd        = osd,
    rofi       = rofi,
    wifi       = wifi,
    browser    = browser,
    fileManager = fileManager,
    gemini     = gemini,
    terminal   = terminal,
    whatsapp   = whatsapp,
    fileman    = fileman,
    inkscape   = inkscape,
}

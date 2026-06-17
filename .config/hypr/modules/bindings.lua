---###################
---### KEYBINDINGS ###
---###################

local programs = require("modules.programs")
local mainMod = "SUPER"

-- System Commands
hl.bind(mainMod .. " + ALT + E", hl.dsp.exec_cmd(programs.confirm .. " exit"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(programs.confirm .. " poweroff"))
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(programs.confirm .. " reboot"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(programs.confirm .. " hyprlock"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd(programs.confirm .. " suspend"))

-- Window Management
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(programs.fullscreen))
hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd(programs.floating))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(programs.minimize .. " amin"))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(programs.minimize .. " bmin"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(programs.opaque))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Utilities
hl.bind("PRINT", hl.dsp.exec_cmd(programs.scrnsht))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(programs.scrnrec))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("pkill -SIGINT wf-recorder"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(programs.clpbrd))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(programs.clrclpbrd))

-- UI & Layers
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.bluetooth))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.rofi))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(programs.wifi))

-- Apps
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(programs.gemini))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd(programs.inkscape))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(programs.whatsapp))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(programs.fileman))

-- Move focus
hl.bind("ALT + h", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + j", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + k", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + l", hl.dsp.focus({ direction = "right" }))

-- Audio & Brightness Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(programs.osd .. " vol_up"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(programs.osd .. " vol_down"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(programs.osd .. " vol_mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(programs.osd .. " mic_mute"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(programs.osd .. " br_up"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(programs.osd .. " br_down"), { locked = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    hl.bind(mainMod .. " + " .. (i % 10), hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    hl.bind(mainMod .. " + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
end

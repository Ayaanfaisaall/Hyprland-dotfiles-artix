--####################
--## LOOK AND FEEL ###
--####################

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 0,
        -- col.active_border = "rgba(ffffff66) rgba(ffffff22) 45deg",
        -- inactive_border = "rgba(595959aa)",
        resize_on_border = false,
        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#decoration

hl.config({
    decoration = {
        rounding = 15,
        -- Change transparency of focused and unfocused windows
        active_opacity = 0.9,
        inactive_opacity = 0.8,
        fullscreen_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 20,
            render_power = 3,
            color = "rgba(00000066)",
        },
        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 2,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            -- xray = true
            vibrancy = 0.2,
            vibrancy_darkness = 0.0,
            brightness = 2.0,
            contrast = 1.0,
            popups = true,
            popups_ignorealpha = 0.2,
        },
    },
})

hl.curve("css_smooth", { type = "bezier", points = { {0.21, 0.09}, {0.3, 1.02} } })
hl.curve("quick_exit", { type = "bezier", points = { {0.15, 0.0}, {0.1, 1.0} } })
hl.curve("rubber",     { type = "spring", mass = 1, stiffness = 70, dampening = 10 })

hl.animation({ leaf = "global",        enabled = true, speed = 7, bezier = "default" })

hl.animation({ leaf = "border",        enabled = true, speed = 5,  bezier = "css_smooth" })

hl.animation({ leaf = "windows",       enabled = true, speed = 5,  bezier = "css_smooth", style = "popin 80%" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 5,  bezier = "css_smooth", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2,  bezier = "quick_exit", style = "popin 80%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 5,  bezier = "css_smooth" })

hl.animation({ leaf = "fadeIn",        enabled = true, speed = 2,  bezier = "quick_exit" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 2,  bezier = "quick_exit" })
hl.animation({ leaf = "fade",          enabled = true, speed = 2,  bezier = "quick_exit" })

hl.animation({ leaf = "layers",        enabled = true, speed = 5,  bezier = "css_smooth" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 5,  bezier = "css_smooth", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2,  bezier = "quick_exit", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 2,  bezier = "quick_exit" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2,  bezier = "quick_exit" })

hl.animation({ leaf = "workspaces",    enabled = true, speed = 5,  bezier = "css_smooth", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 5,  bezier = "css_smooth", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 5,  bezier = "css_smooth", style = "slide" })

hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 5,  bezier = "css_smooth" })

-- dwindle {

--     pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below

--     preserve_split = true # You probably want this

-- }

-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more

hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#misc

hl.config({
    misc = {
        force_default_wallpaper = 0,
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true,
        -- If true disables the random hyprland logo / anime girl background. :(
    },
})

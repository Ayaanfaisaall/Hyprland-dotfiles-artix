--#####################
--#### Layerrules #####
--#####################

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    blur = true,
})

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    ignore_alpha = 0,
})

hl.layer_rule({
    match = {
        namespace = "nwg-dock",
    },
    blur = true,
})

hl.layer_rule({
    match = {
        namespace = "nwg-dock",
    },
    ignore_alpha = 0,
})

hl.layer_rule({
    match = {
        namespace = "notifications",
    },
    blur = true,
})

hl.layer_rule({
    match = {
        namespace = "notifications",
    },
    ignore_alpha = 0,
})

hl.layer_rule({
    match = {
        namespace = "rofi",
    },
    blur = true,
})

hl.layer_rule({
    match = {
        namespace = "rofi",
    },
    ignore_alpha = 0,
})

hl.layer_rule({
    match = {
        namespace = "eww-blur",
    },
    blur = true,
})

hl.layer_rule({
    match = {
        namespace = "eww-blur",
    },
    ignore_alpha = 0,
})

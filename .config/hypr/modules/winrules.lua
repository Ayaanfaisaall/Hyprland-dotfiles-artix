--###################
--#### Winrules #####
--###################

hl.window_rule({
    match = {
        class = ".*",
    },
    size = "900 600",
})

hl.window_rule({
    match = {
        class = "^(Alacritty)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(foot)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(kitty)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(yazi-filechooser)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org.inkscape.Inkscape)$",
    },
    no_blur = true,
})

hl.window_rule({
    match = {
        class = "^(org.inkscape.Inkscape)$",
    },
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    match = {
        class = "^(Alacritty)$",
    },
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    match = {
        class = "^(foot)$",
    },
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    match = {
        class = "^(kitty)$",
    },
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    match = {
        title = "^(Open File)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Open Folder)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Save As)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Select a File)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Choose wallpaper)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Open)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Save)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(xdg-desktop-portal-gtk)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(xdg-desktop-portal-kde)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Open File)(.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        title = "^(Open Folder)(.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        title = "^(Save As)(.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        title = "^(Select a File)(.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        title = "^(Choose wallpaper)(.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(soffice)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(libreoffice.*)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(org.inkscape.Inkscape)$",
    },
    center = true,
})

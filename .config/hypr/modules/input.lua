---#############
---### INPUT ###
---#############

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
            clickfinger_behavior = false,
            -- tap-to-click = true,
            disable_while_typing = true,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- hl.config({
--     device = {
--         name = "epic-mouse-v1",
--         sensitivity = -0.5,
--     },
-- })

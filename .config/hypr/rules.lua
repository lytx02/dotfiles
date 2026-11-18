hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.15,
})

-- Opacity rules for all windows except fullscreen
-- hl.window_rule({
--     match = { class = ".*" },
--     opacity = "1.0 override",
-- })

hl.window_rule({
    match = { class = ".*", fullscreen = true },
    opacity = "1.0 override",
})

hl.layer_rule({
    match = { namespace = "quickshell|sidepanel|settings" },
    blur = true,
    ignore_alpha = 0.01,
})

hl.window_rule({
    match = { class = "kitty" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "file-picker-float",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    center = true,
    size = "900 600",
})

hl.window_rule({
    name = "float-pavucontrol",
    match = { class = "^(pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "float-nm-connection-editor",
    match = { class = "^(nm-connection-editor)$" },
    float = true,
})

hl.window_rule({
    name = "float-blueman-manager",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name = "float-open-file",
    match = { title = "^(Open File)$" },
    float = true,
})

hl.window_rule({
    name = "float-save-file",
    match = { title = "^(Save File)$" },
    float = true,
})

hl.layer_rule({
    match = { namespace = "wallpaper-picker" },
    blur = true,
    ignore_alpha = 0.95,
})

hl.window_rule({
    match = { class = "^(Spotify|kitty|thunar|Thunar|engrampa|wechat)$" },
    opacity = "0.92 override",
})

hl.window_rule({
    match = { class = "^(librewolf|mpv|steam_app_.*|gamescope)$" },
    opacity = "1.0 override",
})

hl.window_rule({
    match = { class = "^(librewolf)$", title = "^(Library)$" },
    opacity = "0.92 override",
})

hl.window_rule({
    match = { class = "^(librewolf)$", title = "^(Enter name of file.*|File Upload.*|Save File.*|Open File.*)$" },
    opacity = "0.92 override",
})

hl.window_rule({
    match = { class = "^(vesktop)$" },
    opacity = "0.999 override",
})

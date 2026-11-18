-- MONITORS 

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@240",
    position = "1920x0",
    scale    = 1,
    bitdepth = 10,
    cm       = "hdr",
})

hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@240", position = "0x0", scale = 1, bitdepth = 10, cm = "hdr" })

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end

for i = 10, 14 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-2" })
end

-- PROGRAMS 


local terminal      = "kitty"
local fileManager   = "thunar"
local menu          = "rofi -show drun"
local reload_qs = "pkill -x qs; pkill -x quickshell; sleep 0.5; QSG_RENDER_LOOP=basic QS_ICON_THEME=Papirus qs"


-- AUTOSTART


hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-restore.sh")
    hl.exec_cmd("sleep 1 && QSG_RENDERER_LOOP=basic QS_ICON_THEME=Papirus qs")
    hl.exec_cmd(terminal)
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("vesktop")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- ENVIRONMENT VARIABLES

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_DESKTOP_PORTAL_HYPRLAND_FORCE_SHM", "1")

-- LOOK AND FEEL 

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,
        active_opacity   = 0.97,
        inactive_opacity = 0.95,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_splash_rendering = true,
        force_default_wallpaper  = 0,
        disable_hyprland_logo    = true,
    },

    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",
        follow_mouse = 1,
        sensitivity  = 0,
        repeat_rate  = 35,
        repeat_delay = 200,
        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
        inactive_timeout    = 30,
        no_hardware_cursors = true,
    },
})

-- GESTURES AND DEVICES 

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

-- KEYBINDS

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())            -- dwindle
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"))      -- dwindle

-- Move focus with arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Apps
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(reload_qs))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qs ipc call bar toggle"))

-- Screenshot region to clipboard
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Fullscreen (SHIFT = maximize, SHIFT+CTRL = real fullscreen)
hl.bind(mainMod .. " + SHIFT + F",        hl.dsp.window.fullscreen({ mode = "maximized",  action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Workspaces 1-10 (0 key = workspace 10)
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness (work on lock screen, repeat when held)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                    { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- WINDOW RULES

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name         = "fcitx_window",
    match        = { class = "^(fcitx)$" },
    float        = true,
    pin          = true,
    stay_focused = true,
})

---- Quickshell etc
hl.bind("SUPER + A",         hl.dsp.exec_cmd("qs ipc call sidepanel toggle"))
hl.bind("SUPER + I",         hl.dsp.exec_cmd("qs ipc call settings toggle"))
hl.bind("SUPER + grave",     hl.dsp.exec_cmd("qs ipc call powermenu toggle"))
hl.bind("SUPER + N",         hl.dsp.exec_cmd("qs ipc call todo toggle"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("qs -n -p ~/.config/quickshell/hyprquickpaper"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("qs ipc call colorpicker toggle"))
hl.bind("SUPER + period",    hl.dsp.exec_cmd("python3 " .. os.getenv("HOME") .. "/.config/lytx02/bin/theme.py toggle"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("pgrep -x rofi >/dev/null && pkill -x rofi || cliphist list | rofi -dmenu -p '' | cliphist decode | wl-copy"))
hl.bind("SUPER + Tab",       hl.dsp.exec_cmd("hyprlock"))
require("look")
require("rules")

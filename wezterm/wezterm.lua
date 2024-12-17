local wezterm = require("wezterm")
local sessionizer = require("sessionizer")

return {

    -- Font
    font = wezterm.font("FiraCode Nerd Font Mono Ret"),
    font_size = 14.0,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    underline_thickness = 2,
    underline_position = -7,

    -- Window
    window_background_opacity = 0.90,
    window_decorations = "TITLE | RESIZE | INTEGRATED_BUTTONS",
    colors = {
        background = '#121212',
        foreground = '#ffffff',
    },

    keys = {
        ---
        { key = "f", mods = "CTRL", action = wezterm.action_callback(sessionizer.toggle) },
    },



}

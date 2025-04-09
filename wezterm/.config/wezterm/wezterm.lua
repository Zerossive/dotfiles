-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Mocha"
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

custom.background = "#1e1e2e"
custom.tab_bar.background = "#1e1e2e"
custom.tab_bar.active_tab.bg_color = "#74c7ec"
custom.tab_bar.active_tab.intensity = "Bold"
custom.tab_bar.inactive_tab.bg_color = "#1e1e2e"
custom.tab_bar.inactive_tab_hover.bg_color = "#45475A"
custom.tab_bar.new_tab.bg_color = "#1e1e2e"
custom.tab_bar.new_tab_hover.bg_color = "#45475A"

config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#BAC2DE"

config.color_schemes = { ["Catppuccin Mocha Sapphire"] = custom }
config.color_scheme = "Catppuccin Mocha Sapphire"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 30

config.background = {
	{
		source = { File = "/home/danny/Elysium/Images/Catppuccin/smoke-dark.png" },
		height = "Cover",
		horizontal_align = "Center",
	},
}

-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono")

config.window_padding = {
	-- left = 0,
	-- right = 0,
	top = 0,
	bottom = 0,
}

config.default_cursor_style = "SteadyBar"
config.force_reverse_video_cursor = true
config.adjust_window_size_when_changing_font_size = false
config.warn_about_missing_glyphs = false
config.max_fps = 144

-- [[ Custom Keyboard Shortcuts ]]
config.keys = {
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
}

-- and finally, return the configuration to wezterm
return config

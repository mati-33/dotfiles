local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	adjust_window_size_when_changing_font_size = false,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	color_scheme = "Vs Code Dark+ (Gogh)",
	window_padding = {
		bottom = 0,
		top = 1,
		left = 1,
		right = 0,
	},
}

return config

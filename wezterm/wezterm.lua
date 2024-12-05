local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.font = wezterm.font_with_fallback({
-- 	"Hack Nerd Font",
-- 	"JetBrains Mono",
-- 	"Fira Code",
-- 	"Iosevka",
-- 	"Iosevka Fixed",
-- 	"Iosevka Term",
-- })
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
config.color_scheme = "Solarized (dark) (terminal.sexy)"

return config

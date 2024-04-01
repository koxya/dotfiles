-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- color scheme:
config.color_scheme = 'Tokyo Night'

-- font
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 16

-- and finally, return the configuration to wezterm
return config

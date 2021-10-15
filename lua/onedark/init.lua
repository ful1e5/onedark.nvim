local util = require("onedark.util")
local theme = require("onedark.theme")
local config_module = require("onedark.config")

local function setup(userConfig)
  -- Applying user configuration
  if userConfig then config_module.applyConfiguration(userConfig) end

  -- Load colorscheme
  util.load(theme.setup(config_module.config))
end

return {setup = setup}

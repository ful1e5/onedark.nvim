local util = require('onedark.util')
local theme = require('onedark.theme')
local config_module = require('onedark.config')

local init = {}

--- @param user_config od.ConfigSchema
init.setup = function(user_config)
  -- Applying user configuration
  if user_config then
    config_module.apply_configuration(user_config)
  end

  -- Load colorscheme
  util.load(theme.setup(config_module.config))
end

return init

local config = require('onedark.config')
local theme = require('onedark.theme')
local util = require('onedark.util')

local init = {}

--- @param user_config od.ConfigSchema
init.setup = function(user_config)
  -- Applying user configuration
  if user_config then
    config.apply_configuration(user_config)
  end

  -- Load colorscheme
  util.load(theme.setup(config.schema))
end

return init

local util = require("onedark.util")
local theme = require("onedark.theme")
local config_module = require("onedark.config")

local function setup(userConfig)
  -- Warning, If config set inside 'vim.g'
  if config_module.vimConfig then
    vim.schedule(function()
      vim.api.nvim_err_writeln(
          [[ful1e5/onedark: onedark will stop supporting vimscript soon, change your config to lua or wrap it around lua << EOF ... EOF]]) -- luacheck: ignore
    end)
  end

  -- Applying user configuration
  if userConfig then config_module.applyConfiguration(userConfig) end

  -- Load colorscheme
  util.load(theme.setup(config_module.config))
end

return {setup = setup}

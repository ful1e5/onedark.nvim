local vim_config = require('onedark.config.vim_config')
local default_config = require('onedark.config.default')

vim = vim or { g = {} }
---@class od.Config
---@field schema od.ConfigSchema
local config = {}

---Accessing global config using vim.g.onedark_* will help in autocompletion.

config.schema = {
  colors = vim_config.get(vim.g.onedark_colors, default_config.colors),
  comment_style = vim_config.get(vim.g.onedark_comment_style, default_config.comment_style),
  dark_float = vim_config.get(vim.g.onedark_dark_float, default_config.dark_float),
  dark_sidebar = vim_config.get(vim.g.onedark_dark_sidebar, default_config.dark_sidebar),
  dev = vim_config.get(vim.g.onedark_dev, default_config.dev),
  function_style = vim_config.get(vim.g.onedark_function_style, default_config.function_style),
  hide_end_of_buffer = vim_config.get(vim.g.onedark_hide_end_of_buffer, default_config.hide_end_of_buffer),
  hide_inactive_statusline = vim_config.get(vim.g.onedark_hide_inactive_statusline, default_config.hide_inactive_statusline),
  highlight_linenumber = vim_config.get(vim.g.onedark_highlight_linenumber, default_config.highlight_linenumber),
  keyword_style = vim_config.get(vim.g.onedark_keyword_style, default_config.keyword_style),
  lualine_bold = vim_config.get(vim.g.onedark_lualine_bold, default_config.lualine_bold),
  msg_area_style = vim_config.get(vim.g.onedark_msg_area_style, default_config.msg_area_style),
  overrides = vim_config.get(vim.g.onedark_overrides, default_config.overrides),
  sidebars = vim_config.get(vim.g.onedark_sidebars, default_config.sidebars),
  transparent = vim_config.get(vim.g.onedark_transparent, default_config.transparent),
  transparent_sidebar = vim_config.get(vim.g.onedark_transparent_sidebar, default_config.transparent_sidebar),
  variable_style = vim_config.get(vim.g.onedark_variable_style, default_config.variable_style),
}

---Override user's configuration
---@param user_config od.ConfigSchema
config.apply_configuration = function(user_config)
  for key, value in pairs(user_config) do
    if value ~= nil then
      if config.schema[key] ~= nil then
        -- override value
        config.schema[key] = value
        vim_config.set(key, value)
      else
        error('config ' .. key .. ' does not exist') -- luacheck: ignore
      end
    end
  end
end

return config

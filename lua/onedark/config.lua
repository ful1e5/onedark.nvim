---@class Config
local config

local vimConfig = false

-- shim vim for kitty and other generators
vim = vim or {g = {}, o = {}}

local function opt(key, default)
  key = "onedark_" .. key
  if vim.g[key] == nil then return default end
  if vim.g[key] == 0 then
    vimConfig = true
    return false
  end
  vimConfig = true
  return vim.g[key]
end

config = {
  transparent = opt("transparent", false),
  commentStyle = opt("italic_comments", true) and "italic" or "NONE",
  keywordStyle = opt("italic_keywords", true) and "italic" or "NONE",
  functionStyle = opt("italic_functions", false) and "italic" or "NONE",
  variableStyle = opt("italic_variables", false) and "italic" or "NONE",
  hideInactiveStatusline = opt("hide_inactive_statusline", false),
  sidebars = opt("sidebars", {}),
  colors = opt("colors", {}),
  dev = opt("dev", false),
  darkFloat = opt("dark_float", true),
  darkSidebar = opt("dark_sidebar", true),
  transform_colors = false
}

local function applyConfiguration(userConfig)
  for key, value in pairs(userConfig) do
    if config[key] ~= nil then
      config[key] = value
    else
      vim.schedule(function()
        vim.api.nvim_err_writeln("ful1e5/onedark: Unable to set option '" .. key .. "'") -- luacheck: ignore
      end)
    end
  end
end

return {config = config, vimConfig = vimConfig, applyConfiguration = applyConfiguration}

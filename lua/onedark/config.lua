---@class Config
local config

-- shim vim for kitty and other generators
vim = vim or {g = {}, o = {}}

local function opt(key, default)
  if vim.g[key] == nil then return default end
  if vim.g[key] == 0 then return false end
  return vim.g[key]
end

local g = {
  transparent = "onedark_transparent",
  commentStyle = "onedark_italic_comments",
  keywordStyle = "onedark_italic_keywords",
  functionStyle = "onedark_italic_functions",
  variableStyle = "onedark_italic_variables",
  hideInactiveStatusline = "onedark_hide_inactive_statusline",
  sidebars = "onedark_sidebars",
  colors = "onedark_colors",
  dev = "onedark_dev",
  darkFloat = "onedark_dark_float",
  darkSidebar = "onedark_dark_sidebar"
}

config = {
  transparent = opt(g.transparent, false),
  commentStyle = opt(g.commentStyle, true) and "italic" or "NONE",
  keywordStyle = opt(g.keywordStyle, true) and "italic" or "NONE",
  functionStyle = opt(g.functionStyle, false) and "italic" or "NONE",
  variableStyle = opt(g.variableStyle, false) and "italic" or "NONE",
  hideInactiveStatusline = opt(g.hideInactiveStatusline, false),
  sidebars = opt(g.sidebars, {}),
  colors = opt(g.colors, {}),
  dev = opt(g.dev, false),
  darkFloat = opt(g.darkFloat, true),
  darkSidebar = opt(g.darkSidebar, true),
  transform_colors = false
}

local function isGlobals()
  for key, gKey in pairs(g) do
    if vim.g[gKey] ~= nil and vim.g[gKey] ~= config[key] then return true end
  end
  return false
end

local function applyConfiguration(userConfig)
  for key, value in pairs(userConfig) do config[key] = value end
end

return {config = config, isGlobals = isGlobals, applyConfiguration = applyConfiguration}

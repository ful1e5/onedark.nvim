---@class Config
local config

local vimConfig = false

-- shim vim for kitty and other generators
vim = vim or {g = {}, o = {}}

local function opt(key, default)
  key = "onedark_" .. key

  if vim.g[key] == nil then
    return default
  else
    vimConfig = true
    if vim.g[key] == 0 then
      return false
    else
      return vim.g[key]
    end
  end
end

config = {
  transparent = opt("transparent", false),
  comment_style = opt("italic_comments", true) and "italic" or "NONE",
  keyword_style = opt("italic_keywords", true) and "italic" or "NONE",
  function_style = opt("italic_functions", false) and "italic" or "NONE",
  variable_style = opt("italic_variables", false) and "italic" or "NONE",
  msg_area_style = opt("italic_msg_area", false) and "italic" or "NONE",
  hide_inactive_statusline = opt("hide_inactive_statusline", false),
  highlight_linenumber = opt("highlight_linenumber", false),
  sidebars = opt("sidebars", {}),
  colors = opt("colors", {}),
  dev = opt("dev", false),
  dark_float = opt("dark_float", true),
  dark_sidebar = opt("dark_sidebar", true),
  transform_colors = false
}

---@param userConfig Config
local function applyConfiguration(userConfig)
  for key, value in pairs(userConfig) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
      else
        error("ful1e5/onedark: Option " .. key .. " does not exist") -- luacheck: ignore
      end
    end
  end
end

return {config = config, vimConfig = vimConfig, applyConfiguration = applyConfiguration}

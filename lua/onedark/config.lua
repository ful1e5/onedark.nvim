-- shim vim for kitty and other generators
vim = vim or {g = {}, o = {}}

--- Get `vim.g` key from config key.
---@param key string
---@return string key A global key for onedark theme which is useful for assigning value to `vim.g`.
local g_key = function(key)
  return "onedark_" .. key
end

local function opt(key, default)
  key = g_key(key)
  if vim.g[key] == nil then
    vim.g[key] = default
    return default
  else
    if vim.g[key] == 1 then
      return true
    elseif vim.g[key] == 0 then
      return false
    else
      return vim.g[key]
    end
  end
end

---@class onedark.Config
local config = {
  colors = opt("colors", {}),
  comment_style = opt("comment_style", "italic"),
  dark_float = opt("dark_float", true),
  dark_sidebar = opt("dark_sidebar", true),
  dev = opt("dev", false),
  function_style = opt("function_style", "italic"),
  hide_end_of_buffer = opt("hide_end_of_buffer", true),
  hide_inactive_statusline = opt("hide_inactive_statusline", false),
  highlight_linenumber = opt("highlight_linenumber", false),
  keyword_style = opt("keyword_style", "italic"),
  lualine_bold = opt("lualine_bold", false),
  msg_area_style = opt("msg_area_style", "NONE"),
  overrides = opt("overrides", function() return {} end),
  sidebars = opt("sidebars", {}),
  transform_colors = false,
  transparent = opt("transparent", false),
  transparent_sidebar = opt("transparent_sidebar", false),
  variable_style = opt("variable_style", "NONE")
}

--- @param user_config onedark.Config
local function apply_configuration(user_config)
  for key, value in pairs(user_config) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
        vim.g[g_key(key)] = value
      else
        error("ful1e5/onedark: Option " .. key .. " does not exist") -- luacheck: ignore
      end
    end
  end
end

return {config = config, apply_configuration = apply_configuration}

local hsluv = require('onedark.hsluv')
local types = require('onedark.types')

---@class od.Util
local util = {}

---@type table<number, od.HexColor>
util.used_colors = {}

---@type table<number, od.HexColor>
util.color_cache = {}

---@type od.HexColor
util.bg = '#000000'

---@type od.HexColor
util.fg = '#ffffff'

---Convert HexColor to RGB
---@param hex_str od.HexColor
---@return table<number, number>
local hex_to_rgb = function(hex_str)
  local hex = '[abcdef0-9][abcdef0-9]'
  local pat = string.format('^#(%s)(%s)(%s)$', hex, hex, hex)
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg od.HexColor foreground color
---@param bg od.HexColor background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
---@return od.HexColor
util.blend = function(fg, bg, alpha)
  bg = hex_to_rgb(bg)
  fg = hex_to_rgb(fg)

  local blend_channel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

---@param hex od.HexColor Color
---@param amount number number between 0 and 1. 0 results in bg, 1 results in fg
---@param bg od.HexColor Background color
---@return od.HexColor
util.darken = function(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end

---@param hex od.HexColor Color
---@param amount number number between 0 and 1. 0 results in bg, 1 results in fg
---@param fg od.HexColor Foreground color
---@return od.HexColor
util.lighten = function(hex, amount, fg)
  return util.blend(hex, fg or util.fg, math.abs(amount))
end

---@param color od.HexColor
---@param percentage number
---@return od.HexColor
util.brighten = function(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

---@param color od.HexColor
---@return od.HexColor
util.invert_color = function(color)
  if color ~= 'NONE' then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * 0.3
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

---Dump unused colors
---@param colors od.ColorPalette
util.debug = function(colors)
  for name, color in pairs(colors) do
    if type(color) == 'table' then
      util.debug(color)
    else
      if util.used_colors[color] == nil then
        print(string.format('not used color: %s=%s', name, color))
      end
    end
  end
end

---@param color od.HexColor
---@return od.HexColor
util.get_color = function(color)
  if vim.o.background == 'dark' then
    return color
  end
  if not util.color_cache[color] then
    util.color_cache[color] = util.invert_color(color)
  end
  return util.color_cache[color]
end

---@param hi_name string
---@param hi od.Highlight|od.LinkHighlight
util.highlight = function(hi_name, hi)
  if hi.fg then
    util.used_colors[hi.fg] = true
  end
  if hi.bg then
    util.used_colors[hi.bg] = true
  end
  if hi.sp then
    util.used_colors[hi.sp] = true
  end

  local style = hi.style and 'gui=' .. hi.style or 'gui=NONE'
  local fg = hi.fg and 'guifg=' .. hi.fg or 'guifg=NONE'
  local bg = hi.bg and 'guibg=' .. hi.bg or 'guibg=NONE'
  local sp = hi.sp and 'guisp=' .. hi.sp or ''

  local hi_cmd = string.format('highlight %s %s %s %s %s', hi_name, style, fg, bg, sp)

  if hi.link then
    vim.cmd(string.format('highlight! link %s %s', hi_name, hi.link))
  else
    -- local data = {}
    -- if color.fg then data.foreground = color.fg end
    -- if color.bg then data.background = color.bg end
    -- if color.sp then data.special = color.sp end
    -- if color.style then data[color.style] = true end
    -- vim.api.nvim_set_hl(ns, group, data)
    vim.cmd(hi_cmd)
  end
end

--- Delete the autocmds when the theme changes to something else
util.on_colorscheme = function()
  if vim.g.colors_name ~= 'onedark' then
    vim.cmd('autocmd! onedark')
    vim.cmd('augroup! onedark')
  end
end

---@param cfg od.ConfigSchema
util.autocmds = function(cfg)
  vim.cmd('augroup onedark')
  vim.cmd('autocmd!')
  vim.cmd('autocmd ColorScheme * lua require("onedark.util").on_colorscheme()')
  if cfg.dev then
    vim.cmd('autocmd BufWritePost */lua/onedark/** nested colorscheme onedark')
  end
  for _, sidebar in ipairs(cfg.sidebars) do
    if sidebar == 'terminal' then
      vim.cmd('autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB')
    else
      vim.cmd(string.format('autocmd FileType %s setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB', sidebar))
    end
  end
  vim.cmd('augroup end')
end

---@param base od.Highlights.Base
util.syntax = function(base)
  for hi_name, hi in pairs(base) do
    util.highlight(hi_name, hi)
  end
end

---@param colors od.ColorPalette
util.terminal = function(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black0
  vim.g.terminal_color_8 = colors.fg_dark
  -- light
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg0
  -- colors
  vim.g.terminal_color_1 = colors.red1
  vim.g.terminal_color_9 = colors.red1
  vim.g.terminal_color_2 = colors.green0
  vim.g.terminal_color_10 = colors.green0
  vim.g.terminal_color_3 = colors.yellow1
  vim.g.terminal_color_11 = colors.yellow1
  vim.g.terminal_color_4 = colors.blue0
  vim.g.terminal_color_12 = colors.blue0
  vim.g.terminal_color_5 = colors.purple0
  vim.g.terminal_color_13 = colors.purple0
  vim.g.terminal_color_6 = colors.cyan0
  vim.g.terminal_color_14 = colors.cyan0

  if vim.o.background == 'light' then
    for i = 0, 15, 1 do
      vim.g['terminal_color_' .. i] = util.get_color(vim.g['terminal_color_' .. i])
    end
  end
end

---@param colors od.ColorPalette
---@return od.ColorPalette
util.light_colors = function(colors)
  if type(colors) == 'string' then
    return util.get_color(colors)
  end
  local ret = {}
  for key, value in pairs(colors) do
    ret[key] = util.light_colors(value)
  end
  return ret
end

---@param hi od.Highlights
util.load = function(hi)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'onedark'

  -- load base theme
  util.syntax(hi.base)
  util.autocmds(hi.config)
  util.terminal(hi.colors)
  util.syntax(hi.plugins)
end

---Override custom highlights in `group`
---@param group table
---@param overrides table
util.apply_overrides = function(group, overrides)
  for k, v in pairs(overrides) do
    if group[k] ~= nil and type(v) == 'table' then
      group[k] = v
    end
  end
end

---@param colors od.ColorPalette
---@param oride_colors od.ColorPalette
---@return od.ColorPalette
function util.color_overrides(colors, oride_colors)
  if type(oride_colors) == 'table' then
    for key, value in pairs(oride_colors) do
      local err_msg = string.format('color "%s" does not exist', key)

      if not colors[key] then
        error(err_msg)
      end
      -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
      if type(colors[key]) == 'table' then
        util.color_overrides(colors[key], value)
      else
        if value:lower() == types.od.HighlightStyle.None:lower() then
          -- set to none
          colors[key] = types.od.HighlightStyle.None
        elseif string.sub(value, 1, 1) == '#' then
          -- hex override
          colors[key] = value
        else
          -- another group
          if not colors[value] then
            error(err_msg)
          end
          colors[key] = colors[value]
        end
      end
    end
  end
  return colors
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
util.template = function(str, table)
  return (str:gsub('($%b{})', function(w)
    return table[w:sub(3, -2)] or w
  end))
end

return util

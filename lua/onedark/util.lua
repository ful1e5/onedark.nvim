local hsluv = require('onedark.hsluv')

local util = {}

util.used_colors = {}
util.color_cache = {}

util.bg = '#000000'
util.fg = '#ffffff'

local function hex_to_rgb(hex_str)
  local hex = '[abcdef0-9][abcdef0-9]'
  local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
util.blend = function(fg, bg, alpha)
  bg = hex_to_rgb(bg)
  fg = hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2), blendChannel(3))
end

util.darken = function(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end
util.lighten = function(hex, amount, fg)
  return util.blend(hex, fg or util.fg, math.abs(amount))
end

util.brighten = function(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

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

util.random_color = function(color)
  if color ~= 'NONE' then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[1] = math.random(1, 360)
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

util.get_color = function(color)
  if vim.o.background == 'dark' then
    return color
  end
  if not util.color_cache[color] then
    util.color_cache[color] = util.invert_color(color)
  end
  return util.color_cache[color]
end

-- local ns = vim.api.nvim_create_namespace("onedark")
util.highlight = function(group, color)
  if not (color.fg or color.bg or color.sp or color.style or color.link) then
    return
  end

  if color.fg then
    util.used_colors[color.fg] = true
  end
  if color.bg then
    util.used_colors[color.bg] = true
  end
  if color.sp then
    util.used_colors[color.sp] = true
  end

  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. util.get_color(color.fg) or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. util.get_color(color.bg) or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. util.get_color(color.sp) or ''

  local hl = 'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp

  if color.link then
    vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
  else
    -- local data = {}
    -- if color.fg then data.foreground = color.fg end
    -- if color.bg then data.background = color.bg end
    -- if color.sp then data.special = color.sp end
    -- if color.style then data[color.style] = true end
    -- vim.api.nvim_set_hl(ns, group, data)
    vim.cmd(hl)
  end
end

util.debug = function(colors)
  colors = colors or require('onedark.colors')
  -- Dump unused colors
  for name, color in pairs(colors) do
    if type(color) == 'table' then
      util.debug(color)
    else
      if util.used_colors[color] == nil then
        print('not used: ' .. name .. ' : ' .. color)
      end
    end
  end
end

--- Delete the autocmds when the theme changes to something else
util.on_colorscheme = function()
  if vim.g.colors_name ~= 'onedark' then
    vim.cmd([[autocmd! onedark]])
    vim.cmd([[augroup! onedark]])
  end
end

---@param config od.ConfigSchema
util.autocmds = function(config)
  vim.cmd([[augroup onedark]])
  vim.cmd([[  autocmd!]])
  vim.cmd([[  autocmd ColorScheme * lua require("onedark.util").on_colorscheme()]])
  if config.dev then
    vim.cmd([[  autocmd BufWritePost */lua/onedark/** nested colorscheme onedark]])
  end
  for _, sidebar in ipairs(config.sidebars) do
    if sidebar == 'terminal' then
      vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    else
      vim.cmd([[  autocmd FileType ]] .. sidebar .. [[ setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    end
  end
  vim.cmd([[augroup end]])
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

util.syntax = function(syntax)
  for group, colors in pairs(syntax) do
    util.highlight(group, colors)
  end
end

---@param colors od.ColorPalette
util.terminal = function(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.bg2

  -- light
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan

  if vim.o.background == 'light' then
    for i = 0, 15, 1 do
      vim.g['terminal_color_' .. i] = util.get_color(vim.g['terminal_color_' .. i])
    end
  end
end

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

---@param theme onedark.Theme
util.load = function(theme)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'onedark'
  -- vim.api.nvim__set_hl_ns(ns)

  -- load base theme
  util.syntax(theme.base)
  util.autocmds(theme.config)
  util.terminal(theme.colors)
  util.syntax(theme.plugins)
end

---@param colors od.ColorPalette
---@param config od.ConfigSchema
util.color_overrides = function(colors, config)
  if type(config.colors) == 'table' then
    for key, value in pairs(config.colors) do
      if not colors[key] then
        error('Color ' .. key .. ' does not exist')
      end

      -- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
      if type(colors[key]) == 'table' then
        util.color_overrides(colors[key], { colors = value })
      else
        if value:lower() == 'none' then
          -- set to none
          colors[key] = 'NONE'
        elseif string.sub(value, 1, 1) == '#' then
          -- hex override
          colors[key] = value
        else
          -- another group
          if not colors[value] then
            error('Color ' .. value .. ' does not exist')
          end
          colors[key] = colors[value]
        end
      end
    end
  end
end

util.light = function(brightness)
  for hl_name, hl in pairs(vim.api.nvim__get_hl_defs(0)) do
    local def = {}
    for key, def_key in pairs({ foreground = 'fg', background = 'bg', special = 'sp' }) do
      if type(hl[key]) == 'number' then
        local hex = string.format('#%06x', hl[key])
        local color = util.invert_color(hex)
        if brightness then
          color = util.brighten(hex, brightness)
        end
        table.insert(def, 'gui' .. def_key .. '=' .. color)
      end
    end
    if hl_name ~= '' and #def > 0 then
      for _, style in pairs({ 'bold', 'italic', 'underline', 'undercurl', 'reverse' }) do
        if hl[style] then
          table.insert(def, 'gui=' .. style)
        end
      end

      vim.cmd('highlight! ' .. hl_name .. ' ' .. table.concat(def, ' '))
    end
  end
end

util.random = function()
  local colors = {}
  for hl_name, hl in pairs(vim.api.nvim__get_hl_defs(0)) do
    local def = {}
    for key, def_key in pairs({ foreground = 'fg', background = 'bg', special = 'sp' }) do
      if type(hl[key]) == 'number' then
        local hex = string.format('#%06x', hl[key])
        local color = colors[hex] and colors[hex] or util.random_color(hex)
        colors[hex] = color
        table.insert(def, 'gui' .. def_key .. '=' .. color)
      end
    end
    if hl_name ~= '' and #def > 0 then
      for _, style in pairs({ 'bold', 'italic', 'underline', 'undercurl', 'reverse' }) do
        if hl[style] then
          table.insert(def, 'gui=' .. style)
        end
      end

      vim.cmd('highlight! ' .. hl_name .. ' ' .. table.concat(def, ' '))
    end
  end
end

return util

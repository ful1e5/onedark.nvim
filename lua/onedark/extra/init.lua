package.path = './lua/?/init.lua;./lua/?.lua'

local types = require('onedark.types')

local function write(str, fileName)
  print('[write] extra/' .. fileName)
  local file = io.open('extras/' .. fileName, 'w')
  file:write(str)
  file:close()
end

for terminal, ext in pairs(types.od.TerminalConf) do
  local config = { transform_colors = true }
  local plugin = require('onedark.extra.' .. terminal)
  write(plugin(config), terminal .. '_onedark' .. '.' .. ext)
end

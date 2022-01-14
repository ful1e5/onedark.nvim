package.path = './lua/?/init.lua;./lua/?.lua'

local types = require('onedark.types')

---Write content to file.
---@param str string content of file.
---@param file_name string path of file.
local function write(str, file_name)
  print('[write]' .. file_name)
  local file = io.open(file_name, 'w')
  file:write(str)
  file:close()
end

for terminal, ext in pairs(types.od.TerminalConf) do
  local plugin = require('onedark.terminal.' .. terminal)
  local file_name = 'terminal/' .. terminal .. '_onedark.' .. ext
  write(plugin(), file_name)
end

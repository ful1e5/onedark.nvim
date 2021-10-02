package.path = "./lua/?/init.lua;./lua/?.lua"

local config_module = require("onedark.config")

local function write(str, fileName)
  print("[write] extra/" .. fileName)
  local file = io.open("extras/" .. fileName, "w")
  file:write(str)
  file:close()
end

local extras = {kitty = "conf", alacritty = "yml"}
for extra, ext in pairs(extras) do
  local plugin = require("onedark.extra." .. extra)
  write(plugin[extra](config_module.config), extra .. "_onedark" .. "." .. ext)
end

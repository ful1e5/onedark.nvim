local config_module = require("onedark.config")
local colors = require("onedark.colors").setup(config_module.config)

return colors.lualine

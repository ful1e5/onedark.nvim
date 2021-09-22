local configModule = require("onedark.config")
local colors = require("onedark.colors").setup(configModule.config)

return colors.lualine

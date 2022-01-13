.DEFAULT_GOAL = lint

src = lua/onedark

extra: $(src)/extra
	@lua $(src)/extra/init.lua

fmt:
	stylua --config-path stylua.toml --glob 'lua/**/*.lua' -- lua

lint: $(src)
	luacheck $(src)

# reload kitty theme
# My Dotfiles: https://github.com/ful1e5/dotfiles
theme = ~/.dotfiles/kitty/.config/kitty/themes/onedark.conf
exts = ./extras/

kitty_pre:
	@rm -rf $(theme)
	@touch $(theme)

kitty: kitty_pre
	@cat $(exts)/kitty_onedark.conf > $(theme)

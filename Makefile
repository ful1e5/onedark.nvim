.DEFAULT_GOAL = check

onedark_path = lua/onedark
extra_path = $(onedark_path)/extra

extra: $(extra_path)
	@lua $(extra_path)/init.lua

format:
	@for file in `find . -name '*.lua'`;do lua-format $$file -i; done;

lint: $(onedark_path)
	@luacheck $(onedark_path)

check: format lint

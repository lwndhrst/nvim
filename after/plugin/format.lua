-- https://github.com/mhartington/formatter.nvim

local filetypes = require("formatter.filetypes")

require("formatter").setup({
	filetype = {
		c = filetypes.c.clangformat,
		cpp = filetypes.cpp.clangformat,
		lua = filetypes.lua.stylua,
		rust = filetypes.rust.rustfmt,
		zig = filetypes.zig.zigfmt,
	},
})

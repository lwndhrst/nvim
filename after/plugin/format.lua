-- https://github.com/stevearc/conform.nvim

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		odin = {},
	},
})

require("formatter").setup({
	logging = false,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require("formatter.filetypes.rust").rustfmt },
	},
})

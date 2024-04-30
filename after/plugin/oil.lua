-- https://github.com/stevearc/oil.nvim

require("oil").setup({
	keymaps = {
		["q"] = "actions.close",
	},
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 4,
	},
})

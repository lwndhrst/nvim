-- https://github.com/folke/todo-comments.nvim

require("todo-comments").setup({
	signs = false,
	gui_style = {
		fg = "BOLD",
	},
	highlight = {
		keyword = "fg",
		after = "",
	},
})

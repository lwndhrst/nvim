-- https://github.com/nvimdev/dashboard-nvim

vim.filetype.add({
	pattern = {
		["Dashboard-.*"] = "dashboard",
	},
})

require("dashboard").setup({
	theme = "doom",
	config = {
		header = {
			"                              ",
			"                              ",
			"                              ",
			"                              ",
			"                              ",
			"                              ",
			"                              ",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⣰⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⣸⣷⣄⠺⣿⣿⣿⠇⣼⣦⡀⠀⠀⠀⠀⣀⣠⡄⠀⠀",
			"⠀⠀⠀⣿⣿⡷⢠⣾⣦⣀⠻⣿⣿⣷⢈⠛⣡⣾⠟⣉⣴⣾⣷⡄⢿⣿⡿⠀⠀⠀",
			"⠀⠀⠀⢸⡿⢠⣿⣿⣿⣿⣷⡜⠟⣡⣾⣧⡙⠇⣼⣿⣿⣿⣿⣿⡄⢿⣷⠀⠀⠀",
			"⠀⠀⠀⢾⡇⣼⣿⣿⣿⡿⢋⣴⣾⣿⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣷⢸⣿⠀⠀⠀",
			"⣤⣀⣀⣘⠇⢹⣿⡿⠿⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⡏⠸⢋⣀⣀⣤",
			"⢿⣿⣿⣿⣿⡌⢿⠃⣷⣤⣍⡛⠻⢿⣿⣿⣿⣿⣿⣿⣇⢹⣿⡟⢡⣿⣿⣿⣿⣿",
			"⠘⣿⣿⣿⣿⣿⣦⢸⣿⣿⣿⣿⣿⣶⣤⣉⠻⣿⣿⣿⣿⠘⣡⣴⣿⣿⣿⣿⣿⠇",
			"⠀⠘⢿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⢿⣿⡿⢸⣿⣿⣿⣿⣿⣿⠏⠀",
			"⠀⠀⠀⠙⠿⣿⣿⣷⡘⢿⣿⣿⣿⣿⣿⣿⣿⡇⣸⣿⠃⣾⣿⣿⣿⣿⠟⠁⠀⠀",
			"⠀⠀⠀⠀⠀⠈⠙⠛⠻⢶⡌⠙⠛⠿⠿⠛⣋⡴⠟⠡⠾⠛⠛⠋⠉⠀⠀⠀⠀⠀",
			"                              ",
			"                              ",
		},
		center = {
			{
				icon = " ",
				icon_hl = "@String",
				desc = " Find File   ",
				desc_hl = "@String",
				action = "Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "@String",
				desc = " Recent Files",
				desc_hl = "@String",
				action = "Telescope oldfiles",
			},
			{
				icon = " ",
				icon_hl = "@String",
				desc = " Search Text ",
				desc_hl = "@String",
				action = "Telescope live_grep",
			},
			{
				icon = " ",
				icon_hl = "@String",
				desc = " Config      ",
				desc_hl = "@String",
				action = function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
			},
		},
		footer = {},
	},
})

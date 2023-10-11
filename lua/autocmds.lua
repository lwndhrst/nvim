local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})

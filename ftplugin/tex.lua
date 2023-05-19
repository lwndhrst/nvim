vim.bo.textwidth = 80

-- extra latex keymaps
local buf_nr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = buf_nr }
local map = vim.keymap.set

-- replace latex notation with actual german umlaut and ß characters
map("n", "<Space>ru", function()
	vim.cmd(
		[[!sed -i ]]
			.. [[-e 's/\\"A/Ä/g ; s/\\"a/ä/g' ]]
			.. [[-e 's/\\"O/Ö/g ; s/\\"o/ö/g' ]]
			.. [[-e 's/\\"U/Ü/g ; s/\\"u/ü/g' ]]
			.. [[-e 's/{\\ss}/ß/g ; s/\\ss /ß/g' ]]
			.. vim.fn.expand("%:p") -- current buffer file path
	)
end, opts)

-- toggle german spell checking
map("n", "<Space>sp", ":setlocal spell! spelllang=de<CR>", opts)

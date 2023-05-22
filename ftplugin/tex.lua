vim.bo.textwidth = 80

-- extra latex keymaps
local buf_nr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = buf_nr }
local map = vim.keymap.set

-- replace latex notation with actual german umlaut and ß characters
map("n", "<Space>ru", function()
	vim.cmd([[%s/\\"A/Ä/eg]])
	vim.cmd([[%s/\\"a/ä/eg]])
	vim.cmd([[%s/\\"O/Ö/eg]])
	vim.cmd([[%s/\\"o/ö/eg]])
	vim.cmd([[%s/\\"U/Ü/eg]])
	vim.cmd([[%s/\\"u/ü/eg]])
	vim.cmd([[%s/{\\ss}/ß/eg]])
	vim.cmd([[%s/\\ss /ß/eg]])
end, opts)

-- toggle german spell checking
map("n", "<Space>sp", ":setlocal spell! spelllang=de<CR>", opts)

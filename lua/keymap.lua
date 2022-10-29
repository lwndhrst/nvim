local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Telescope
-- map('n', '<Space>ff', [[:lua require('telescope.builtin').find_files()<CR>]], opts)
map('n', '<Space>ff', ':Telescope find_files<CR>', opts)             -- find files
map('n', '<Space>fr', ':Telescope oldfiles<CR>', opts)               -- find recent files
map('n', '<Space>fb', ':Telescope buffers<CR>', opts)                -- find buffers
map('n', '<Space>ft', ':Telescope live_grep<CR>', opts)              -- find text
map('n', '<Space>fs', ':Telescope lsp_document_symbols<CR>', opts)   -- find lsp symbol (current document)
map('n', '<Space>fg', ':Telescope git_files<CR>', opts)              -- find git files

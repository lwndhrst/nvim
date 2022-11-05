vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.mouse = 'a'

-- Enable global statusline
vim.o.laststatus = 3

-- Load packer
require('plugins')

-- Set up plugins
require('config.mason')
require('config.lsp')
require('config.cmp')
require('config.dashboard')
require('config.nvim_tree')
require('config.treesitter')

-- Load keymaps
require('keymaps').setup()

-- Set colorscheme
require('themes.gruvbox_material').setup()
-- require('themes.catppuccin').setup()

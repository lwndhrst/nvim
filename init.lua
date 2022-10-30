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

vim.g.gruvbox_material_transparent_background = 2

-- Load packer
require('plugins')

-- Set up plugins
require('plugins.mason')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.dashboard')
require('plugins.nvim_tree')
require('plugins.treesitter')
require('plugins.lualine')

-- Load keymap
require('keymap').setup()

vim.cmd('colorscheme gruvbox-material')
vim.cmd('hi TelescopeSelection guibg=#202020')

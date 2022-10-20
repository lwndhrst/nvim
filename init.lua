vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.mouse = 'a'

vim.g.gruvbox_material_transparent_background = 2

require('plugins')

require('config.mason')
require('config.lsp')
require('config.dashboard')
-- require('config.bufferline')
require('config.nvim_tree')
require('config.treesitter')

vim.cmd('colorscheme gruvbox-material')

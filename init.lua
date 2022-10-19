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

require('mason_config')
require('lsp_config')
require('dashboard_config')
-- require('bufferline_config')
require('treesitter_config')

vim.cmd('colorscheme gruvbox-material')

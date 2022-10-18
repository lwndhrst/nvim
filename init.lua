vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true

vim.g.mapleader = ' '
vim.g.gruvbox_material_transparent_background = 2

require('plugins')

require('mason').setup()
require('mason-lspconfig').setup()
require('lspconfig').rust_analyzer.setup({})

vim.cmd('colorscheme gruvbox-material')

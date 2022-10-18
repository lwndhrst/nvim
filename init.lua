vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.completeopt = 'menu,menuone,noselect'

vim.g.gruvbox_material_transparent_background = 2

require('plugins')

require('mason').setup()
require('mason-lspconfig').setup()
require('lsp')

require('nvim-treesitter.configs').setup({ highlight = { enable = true }})

vim.cmd('colorscheme gruvbox-material')

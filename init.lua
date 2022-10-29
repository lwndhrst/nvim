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

-- load packer
require('plugins')

-- set up plugins
require('plugins.mason')
require('plugins.lsp')
require('plugins.dashboard')
-- require('plugins.bufferline')
require('plugins.nvim_tree')
require('plugins.treesitter')

-- load keymap
require('keymap')

vim.cmd('colorscheme gruvbox-material')
vim.cmd('hi TelescopeSelection guibg=#202020')

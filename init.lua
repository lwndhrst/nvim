vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.mouse = "a"

-- vim.o.colorcolumn = "80"
vim.o.textwidth = "80"

-- enable global statusline
vim.o.laststatus = 3

-- load keymaps
require("keymaps").setup()

-- setup custom filetypes
require("filetypes")

-- set colorscheme
require("themes.rose_pine").setup()

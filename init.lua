vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mouse = "a"

-- enable global statusline
vim.opt.laststatus = 3

-- load keymaps
require("keymaps").setup()

-- setup custom filetypes
require("filetypes")

-- set colorscheme
require("themes.rose_pine").setup()

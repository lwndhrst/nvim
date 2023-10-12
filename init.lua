vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mouse = "a"
vim.opt.wrap = false

-- enable global statusline
vim.opt.laststatus = 3

-- setup custom filetypes
require("filetypes")

-- load keymaps
require("keymaps").setup()

-- load autocmds
require("autocmds")

-- set colorscheme
require("themes.rose_pine").setup()

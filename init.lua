vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.mouse = "a"
vim.o.colorcolumn = "80"
vim.o.textwidth = "80"

-- enable global statusline
vim.o.laststatus = 3

-- load packer
require("plugins")

-- set up plugins
require("config.mason")
require("config.lsp")
require("config.cmp")
require("config.format")
require("config.dashboard")
require("config.nvim_tree")
require("config.treesitter")

-- load keymaps
require("keymaps").setup()

-- set colorscheme
require("themes.gruvbox_material").setup()
-- require("themes.catppuccin").setup()

local parser_dir = vim.fn.stdpath("data") .. "/treesitter/parsers"
vim.opt.runtimepath:append(parser_dir)

require("nvim-treesitter.configs").setup({
    parser_install_dir = parser_dir,
    auto_install = true,
    ignore_install = { "latex" },
    highlight = { enable = true, disable = { "latex" } },
})

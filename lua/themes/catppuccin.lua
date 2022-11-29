local M = {}

function M.setup()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
    })

    require("config.lualine").setup("catppuccin")

    vim.cmd("colorscheme catppuccin")
end

return M

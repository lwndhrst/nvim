local M = {}

function M.setup()
    vim.g.gruvbox_material_transparent_background = 2

    require("config.lualine").setup("gruvbox-material")

    vim.cmd("colorscheme gruvbox-material")
    vim.cmd("hi TelescopeSelection guibg=#202020")
end

return M

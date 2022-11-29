require("formatter").setup({
    filetype = {
        lua = {
            function()
                local stylua = require("formatter.filetypes.lua").stylua()
                table.insert(stylua.args, 1, "--indent-type")
                table.insert(stylua.args, 2, "Spaces")
                return stylua
            end,
        },
        rust = {
            function()
                local rustfmt = require("formatter.filetypes.rust").rustfmt()
                rustfmt.args = { "--edition", "2021" }
                return rustfmt
            end,
        },
    },
})

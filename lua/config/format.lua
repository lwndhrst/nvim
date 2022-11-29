local util = require("formatter.util")

function stylua()
    return {
        exe = "stylua",
        args = {
            "--indent-type",
            "Spaces",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
        },
        stdin = true,
    }
end

function rustfmt()
    return {
        exe = "rustfmt",
        args = {
            "--edition",
            "2021",
        },
        stdin = true,
    }
end

require("formatter").setup({
    filetype = {
        lua = { stylua },
        rust = { rustfmt },
    },
})

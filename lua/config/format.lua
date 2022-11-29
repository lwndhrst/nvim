require("formatter").setup({
    logging = true,
    filetype = {
        rust = { require("formatter.filetypes.rust").rustfmt },
    },
})

require('lsp-format').setup({})

local keymap = require('keymap')

local on_attach = function(client, bufnr)
    require('lsp-format').on_attach(client)
    keymap.lsp_buf_maps()
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert(keymap.cmp_maps()),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        -- { name = 'cmdline' },
    }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
})

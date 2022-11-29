require('lsp-format').setup({})

local keymaps = require('keymaps')

local on_attach = function(client, buf_nr)
    require('lsp-format').on_attach(client)
    keymaps.lsp_buf_maps(buf_nr)
end

local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local flags = {
    debounce_text_changes = 150,
}

lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,
})

lsp.texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,
})

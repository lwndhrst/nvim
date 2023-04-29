local keymaps = require("keymaps")

local on_attach = function(client, buf_nr)
	keymaps.lsp_buf_maps(buf_nr)
end

local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local flags = {
	debounce_text_changes = 150,
}

-- c/c++
lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

-- odin
lsp.ols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

-- rust
lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

-- tex
lsp.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

-- zig
lsp.zls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = flags,
})

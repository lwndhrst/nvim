-- https://github.com/neovim/nvim-lspconfig

local keymaps = require("keymaps")
local lsp = require("lspconfig")

local on_attach = function(client, buf_nr)
	keymaps.lsp_buf_maps(buf_nr)
end

-- default config
local config = {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = { debounce_text_changes = 150 },
}

-- c/c++
lsp.clangd.setup(config)

-- glsl
lsp.glslls.setup(config)

-- nix
lsp.nil_ls.setup(config)

-- odin
lsp.ols.setup(config)

-- rust
lsp.rust_analyzer.setup(config)

-- tex
lsp.texlab.setup(config)

-- zig
lsp.zls.setup(config)

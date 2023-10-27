-- https://github.com/neovim/nvim-lspconfig

local keymaps = require("keymaps")
local lsp = require("lspconfig")

local on_attach = function(client, buf_nr)
	keymaps.lsp_buf_maps(buf_nr)
end

local default_config = {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = { debounce_text_changes = 150 },
}

-- c/c++
lsp.clangd.setup(vim.tbl_extend("error", default_config, {
	cmd = { "clangd", "--header-insertion=never" },
}))

-- glsl
lsp.glslls.setup(default_config)

-- nix
lsp.nil_ls.setup(default_config)

-- odin
lsp.ols.setup(default_config)

-- rust
lsp.rust_analyzer.setup(default_config)

-- tex
lsp.texlab.setup(default_config)

-- zig
lsp.zls.setup(default_config)

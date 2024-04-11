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

-- gdscript lsp
local gdscript_addr = os.getenv("GDScript_Addr") or "127.0.0.1"
local gdscript_port = os.getenv("GDScript_Port") or "6005"
local gdscript_cmd = nil
if vim.fn.has("win32") == 1 then
	gdscript_cmd = { "ncat", gdscript_addr, gdscript_port }
else 
	gdscript_cmd = vim.lsp.rpc.connect(gdscript_addr, gdscript_port)
end
lsp.gdscript.setup(vim.tbl_extend("error", default_config, {
	cmd = gdscript_cmd,
}))

-- glsl
-- lsp.glslls.setup(default_config)

-- nix
lsp.nil_ls.setup(default_config)

-- odin
lsp.ols.setup(default_config)

-- python
lsp.pyright.setup(default_config)

-- rust
lsp.rust_analyzer.setup(default_config)

-- tex
lsp.texlab.setup(default_config)

-- zig
lsp.zls.setup(default_config)

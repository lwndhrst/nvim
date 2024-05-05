-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

require("mason").setup()
require("mason-lspconfig").setup()

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

-- c#
lsp.omnisharp.setup(default_config)

-- gdscript
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
lsp.glsl_analyzer.setup(default_config)

-- lua
lsp.lua_ls.setup(vim.tbl_extend("error", default_config, {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
}))

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

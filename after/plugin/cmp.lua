-- https://github.com/hrsh7th/nvim-cmp
--
-- completion sources
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-line
-- https://github.com/saadparwaiz1/cmp_luasnip
--
-- snippet engine
-- https://github.com/L3MON4D3/LuaSnip

local luasnip = require("luasnip")
local cmp = require("cmp")
local keymaps = require("keymaps")

cmp.setup({
	window = {
		completion = {
			winhighlight = "Normal:NormalFloat",
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert(keymaps.cmp_maps()),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
	formatting = {
		format = function(entry, cmp_item)
			-- see :h complete-items
			-- trim leading whitespace (looking at you clangd <.<)
			cmp_item.abbr = string.gsub(cmp_item.abbr, "^%s+", "")

			-- remove duplicates
			cmp_item.dup = 0

			return cmp_item
		end,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

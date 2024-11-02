-- https://github.com/rose-pine/neovim
-- https://github.com/nvim-lualine/lualine.nvim

local M = {}


local function lualine_theme()
	local p = require("rose-pine.palette")
	p.base = "#000f16"
	p.surface = "#0f2129"
	p.muted = "#495863"

	return {
		normal = {
			a = { bg = p.rose, fg = p.base, gui = "bold" },
			b = { bg = p.surface, fg = p.rose },
			c = { bg = nil, fg = p.text },
		},
		insert = {
			a = { bg = p.foam, fg = p.base, gui = "bold" },
			b = { bg = p.surface, fg = p.foam },
			c = { bg = nil, fg = p.text },
		},
		visual = {
			a = { bg = p.iris, fg = p.base, gui = "bold" },
			b = { bg = p.surface, fg = p.iris },
			c = { bg = nil, fg = p.text },
		},
		replace = {
			a = { bg = p.pine, fg = p.base, gui = "bold" },
			b = { bg = p.surface, fg = p.pine },
			c = { bg = nil, fg = p.text },
		},
		command = {
			a = { bg = p.love, fg = p.base, gui = "bold" },
			b = { bg = p.surface, fg = p.love },
			c = { bg = nil, fg = p.text },
		},
		inactive = {
			a = { bg = p.base, fg = p.muted, gui = "bold" },
			b = { bg = p.surface, fg = p.muted },
			c = { bg = nil, fg = p.muted },
		},
	}
end

function M.setup()
	require("rose-pine").setup({
		variant = "main",

		styles = {
			bold = false,
			italic = false,
			transparency = false,
		},

		palette = {
			main = {
				base = "#000f16",
				surface = "#0f2129",
				overlay = "#203039",
				muted = "#495863",
				subtle = "#999fa5",
			},
		},

		highlight_groups = {
			-- TelescopeBorder = { fg = "highlight_high", bg = "base" },
			-- TelescopeNormal = { bg = "base" },
			-- TelescopePromptNormal = { bg = "base" },
			-- TelescopeResultsNormal = { fg = "subtle", bg = "base" },
			-- TelescopeSelection = { fg = "text", bg = "base" },
			TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

			-- NormalFloat = { bg = "base" },
			-- FloatBorder = { fg = "overlay", bg = "surface" },
			FloatTitle = { fg = "foam", bg = "surface" },
		},

		before_highlight = function(group, highlight, palette)
			if highlight.bg == palette.base then
				highlight.bg = nil
			end
		end,
	})

	-- custom colors
	-- base00: "#000f16"
	-- base01: "#0f2129"
	-- base02: "#203039"
	-- base03: "#495863"
	-- base04: "#999fa5"
	-- base05: "#c2c3c7"
	-- base06: "#dbdbdc"
	-- base07: "#f1f1f1"

	require("lualine").setup({
		options = {
			theme = lualine_theme(),

			-- unicode powerline glyphs:
			--    
			--    
			--    
			--    
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	})

	vim.cmd("colorscheme rose-pine")
end

return M

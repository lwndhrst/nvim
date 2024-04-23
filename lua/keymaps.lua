local M = {}

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

function M.setup()
	-- terminal
	map("t", "<ESC>", "<C-\\><C-n>", opts)

	-- floaterm
	-- https://github.com/voldikss/vim-floaterm
	map("n", "<SPACE>t", ":FloatermToggle<CR>", opts)

	-- telescope
	-- https://github.com/nvim-telescope/telescope.nvim
	local telescope = require("telescope.builtin")
	map("n", "<SPACE>ff", telescope.find_files, opts)
	map("n", "<SPACE>fg", telescope.git_files, opts)
	map("n", "<SPACE>fr", telescope.oldfiles, opts)
	map("n", "<SPACE>fb", telescope.buffers, opts)
	map("n", "<SPACE>ft", telescope.live_grep, opts)
	map("n", "<SPACE>fs", telescope.lsp_document_symbols, opts)
	map("n", "<SPACE>fd", telescope.diagnostics, opts)

	-- ranger
	-- https://github.com/kelly-lin/ranger.nvim
	--[[
	local ranger_nvim = require("ranger-nvim")
	map("n", "<SPACE>rr", function()
		ranger_nvim.open(true)
	end, opts)
	--]]
	
	-- lf
	-- https://github.com/ptzz/lf.vim
	map("n", "<SPACE>rr", ":Lf<CR>", opts)
	
	-- netrw
	map("n", "<SPACE>e", ":Lexplore<CR>", opts)

	-- harpoon
	-- https://github.com/ThePrimeagen/harpoon
	local harpoon = require("harpoon")
	map("n", "<SPACE>ma", function() harpoon:list():add() end, opts)
	map("n", "<SPACE>ml", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
	map("n", "<C-j>", function() harpoon:list():next() end, opts)
	map("n", "<C-k>", function() harpoon:list():prev() end, opts)
	for i = 1, 9 do
		local binding = "<SPACE>j" .. i
		local cmd = function()
			harpoon:list():select(i)
		end
		map("n", binding, cmd, opts)
	end

	-- move line/selection
	map("n", "<A-j>", ":m +1<CR>==", opts)
	map("n", "<A-k>", ":m -2<CR>==", opts)
	map("i", "<A-j>", "<ESC>:m +1<CR>==gi", opts)
	map("i", "<A-k>", "<ESC>:m -2<CR>==gi", opts)
	map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

	-- diagnostics
	map("n", "<SPACE>d", vim.diagnostic.open_float, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
	map("n", "<SPACE>q", vim.diagnostic.setloclist, opts)

	-- formatter (configured by after/plugin/format.lua)
	map("n", "<SPACE>F", ":Format<CR>", opts)
end

-- lsp on_attach
function M.lsp_buf_maps(buf_nr)
	local buf_opts = { noremap = true, silent = true, buffer = buf_nr }
	map("n", "gd", vim.lsp.buf.definition, buf_opts)
	map("n", "gi", vim.lsp.buf.implementation, buf_opts)
	map("n", "K", vim.lsp.buf.hover, buf_opts)
	map("n", "<SPACE>rn", vim.lsp.buf.rename, buf_opts)
	map("n", "<SPACE>ca", vim.lsp.buf.code_action, buf_opts)
end

-- cmp
function M.cmp_maps()
	local luasnip = require("luasnip")
	local cmp = require("cmp")
	return {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<TAB>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-TAB>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}
end

return M

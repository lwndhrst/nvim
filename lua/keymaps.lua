local M = {}

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

function M.setup()
	-- terminal
	map("t", "<ESC>", "<C-\\><C-n>", opts) -- exit terminal mode

	-- telescope
	-- https://github.com/nvim-telescope/telescope.nvim
	local telescope = require("telescope.builtin")
	map("n", "<SPACE>ff", telescope.find_files, opts) -- find files
	map("n", "<SPACE>fg", telescope.git_files, opts) -- find git files
	map("n", "<SPACE>fr", telescope.oldfiles, opts) -- find recent
	map("n", "<SPACE>fb", telescope.buffers, opts) -- find buffers
	map("n", "<SPACE>ft", telescope.live_grep, opts) -- find text (grep)
	map("n", "<SPACE>fs", telescope.lsp_document_symbols, opts) -- find lsp symbols (current document)
	map("n", "<SPACE>fd", telescope.diagnostics, opts) -- find diagnostics

	-- ranger
	-- https://github.com/kelly-lin/ranger.nvim
	local ranger_nvim = require("ranger-nvim")
	map("n", "<SPACE>rr", function()
		ranger_nvim.open(true)
	end, opts)

	-- harpoon
	-- https://github.com/ThePrimeagen/harpoon
	local harpoon_mark = require("harpoon.mark")
	local harpoon_term = require("harpoon.term")
	local harpoon_ui = require("harpoon.ui")
	local harpoon_cmdui = require("harpoon.cmd-ui")
	map("n", "<SPACE>t", function()
		harpoon_term.gotoTerminal(1)
	end, opts) -- jump to term 1
	map("n", "<SPACE>cl", harpoon_cmdui.toggle_quick_menu, opts) -- command ui
	map("n", "<SPACE>ma", harpoon_mark.add_file, opts) -- add mark for current file
	map("n", "<SPACE>ml", harpoon_ui.toggle_quick_menu, opts) -- mark ui
	map("n", "<C-j>", harpoon_ui.nav_next, opts) -- jump to next mark
	map("n", "<C-k>", harpoon_ui.nav_prev, opts) -- jump to prev mark
	for i = 1, 9 do
		local binding = "<SPACE>j" .. i
		local cmd = function()
			harpoon_ui.nav_file(i)
		end
		map("n", binding, cmd, opts) -- jump to specific mark
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

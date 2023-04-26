local M = {}

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

function M.setup()
	-- terminal
	map("t", "<Esc>", "<C-\\><C-n>", opts) -- exit terminal mode

	-- telescope
	local telescope = require("telescope.builtin")
	map("n", "<Space>ff", telescope.find_files, opts) -- find files
	map("n", "<Space>fg", telescope.git_files, opts) -- find git files
	map("n", "<Space>fr", telescope.oldfiles, opts) -- find recent
	map("n", "<Space>fb", telescope.buffers, opts) -- find buffers
	map("n", "<Space>ft", telescope.live_grep, opts) -- find text (grep)
	map("n", "<Space>fs", telescope.lsp_document_symbols, opts) -- find lsp symbols (current document)
	map("n", "<Space>fd", telescope.diagnostics, opts) -- find diagnostics

	-- lsp diagnostics
	map("n", "<Space>d", vim.diagnostic.open_float, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
	map("n", "<Space>q", vim.diagnostic.setloclist, opts)

	-- file explorer
	map("n", "<Space>e", function()
		if vim.bo.filetype == "netrw" then
			vim.cmd("Rexplore")
			if vim.bo.filetype == "dashboard" then
				vim.cmd("Dashboard")
			end
		else
			vim.cmd("Explore")
		end
	end, opts)

	-- harpoon
	local harpoon_mark = require("harpoon.mark")
	local harpoon_term = require("harpoon.term")
	local harpoon_ui = require("harpoon.ui")
	map("n", "<Space>jt", function()
		harpoon_term.gotoTerminal(1)
	end, opts) -- jump to term 1
	map("n", "<Space>ja", harpoon_mark.add_file, opts) -- add mark for current file
	map("n", "<Space>jl", harpoon_ui.toggle_quick_menu, opts) -- toggle menu
	map("n", "<C-j>", harpoon_ui.nav_next, opts) -- jump to next mark
	map("n", "<C-k>", harpoon_ui.nav_prev, opts) -- jump to prev mark
	for i = 1, 9 do
		local binding = "<Space>j" .. i
		local cmd = function()
			harpoon_ui.nav_file(i)
		end
		map("n", binding, cmd, opts) -- jump to specific mark
	end

	-- navigation
	map("n", "<Space>bj", ":bnext<CR>", opts)
	map("n", "<Space>bk", ":bprev<CR>", opts)

	-- move line/visual
	map("n", "<A-j>", ":m +1<CR>==", opts)
	map("n", "<A-k>", ":m -2<CR>==", opts)
	map("i", "<A-j>", "<Esc>:m +1<CR>==gi", opts)
	map("i", "<A-k>", "<Esc>:m -2<CR>==gi", opts)
	map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

	-- formatter
	map("n", "<Space>F", ":Format<CR>", opts)
end

-- lsp on_attach
function M.lsp_buf_maps(buf_nr)
	local buf_opts = { noremap = true, silent = true, buffer = buf_nr }
	map("n", "gd", vim.lsp.buf.definition, buf_opts)
	map("n", "K", vim.lsp.buf.hover, buf_opts)
	map("n", "<Space>rn", vim.lsp.buf.rename, buf_opts)
	map("n", "<Space>ca", vim.lsp.buf.code_action, buf_opts)
end

-- cmp
function M.cmp_maps()
	local luasnip = require("luasnip")
	local cmp = require("cmp")
	return {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}
end

return M

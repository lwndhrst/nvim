local M = {}

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Generic (called from init.lua)
function M.setup()
    -- Telescope
    local telescope = require('telescope.builtin')
    map('n', '<Space>ff', telescope.find_files, opts)               -- find files
    map('n', '<Space>fr', telescope.oldfiles, opts)                 -- find recent
    map('n', '<Space>fb', telescope.buffers, opts)                  -- find buffers
    map('n', '<Space>fg', telescope.live_grep, opts)                -- find grep
    map('n', '<Space>fs', telescope.lsp_document_symbols, opts)     -- find lsp symbols (current document)
    map('n', '<Space>fd', telescope.diagnostics, opts)              -- find diagnostics

    -- LSP diagnostics
    map('n', '<Space>d', vim.diagnostic.open_float, opts)
    map('n', '[d', vim.diagnostic.goto_prev, opts)
    map('n', ']d', vim.diagnostic.goto_next, opts)
    map('n', '<Space>q', vim.diagnostic.setloclist, opts)

    -- File explorer
    map('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>', opts)

    -- Navigation
    map('n', '<C-j>', '<Cmd>bnext<CR>', opts)
    map('n', '<C-k>', '<Cmd>bprev<CR>', opts)
end

-- LSP on_attach
function M.lsp_buf_maps(buf_nr)
    local buf_opts = { noremap = true, silent = true, buffer = buf_nr }

    map('n', 'gD', vim.lsp.buf.declaration, buf_opts)
    map('n', 'gd', vim.lsp.buf.definition, buf_opts)
    map('n', 'K', vim.lsp.buf.hover, buf_opts)
    map('n', 'gi', vim.lsp.buf.implementation, buf_opts)
    map('n', '<C-K>', vim.lsp.buf.signature_help, buf_opts)
    map('n', '<Space>wa', vim.lsp.buf.add_workspace_folder, buf_opts)
    map('n', '<Space>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
    map('n', '<Space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, buf_opts)
    map('n', '<Space>D', vim.lsp.buf.type_definition, buf_opts)
    map('n', '<Space>rn', vim.lsp.buf.rename, buf_opts)
    map('n', '<Space>ca', vim.lsp.buf.code_action, buf_opts)
    map('n', 'gr', vim.lsp.buf.references, buf_opts)
    map('n', '<Space>F', ':Format<CR>', buf_opts)                   -- lsp-format.nvim
end

-- CMP
function M.cmp_maps()
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    return {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }), 
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }
end

return M

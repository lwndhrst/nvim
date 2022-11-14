return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- lsp, cmp, dap
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'lukas-reineke/lsp-format.nvim'
    use 'mfussenegger/nvim-dap'

    -- misc
    use 'kyazdani42/nvim-web-devicons'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'glepnir/dashboard-nvim'

    -- themes
    use 'sainnhe/gruvbox-material'
    use { 'catppuccin/nvim', as = 'catppuccin' }
end)

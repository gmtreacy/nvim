vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use { "ibhagwan/fzf-lua",
    --     -- optional for icon support
    --     requires = { "nvim-tree/nvim-web-devicons" }
    -- }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "AbdelrahmanDwedar/awesome-nvim-colorschemes"

    -- use({
    --     'folke/tokyonight.nvim',
    --     as = 'tokyonight',
    --     config = function()
    --         vim.cmd('colorscheme tokyonight')
    --     end
    -- })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- use('mbbill/undotree')
    use {
        "jiaoshijie/undotree",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    use('tpope/vim-fugitive')

    use("David-Kunz/gen.nvim")

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'neovim/nvim-lspconfig' },

            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- snippets
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
end)

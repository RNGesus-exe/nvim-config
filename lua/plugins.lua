require('packer').startup(function()
    -- Package Manager
    use {
        'wbthomason/packer.nvim',
    }

    -- Mason
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = [[ require('plugins/mason') ]]
    }

    -- Linter
    use {
        "mfussenegger/nvim-lint",
        config = [[ require('plugins/linter') ]]
    }

    -- Color Theme
    use {
        'tomasr/molokai'
    }

    -- Indent Line Braces
    -- use {
    --    "lukas-reineke/indent-blankline.nvim",
    --    config = [[ require('plugins/indent_line') ]]
    -- }

    -- Status Bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = [[ require('plugins/lualine') ]]
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow"
        },
        config = [[ require('plugins/treesitter') ]]
    }

    -- Fuzzy Search / Telescope
    use({ "nvim-lua/plenary.nvim" })
    use({
        "nvim-telescope/telescope.nvim",
        config = [[require('plugins/telescope')]],
        requires = "nvim-lua/plenary.nvim",
    })

    -- UndoTree
    use {
        'mbbill/undotree',
        config = [[ require('plugins/undotree') ]]
    }

    -- LSP Setup
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = [[ require('plugins/lsp') ]]
    }

    -- Git
    use {
        'tpope/vim-fugitive'
    }
end)

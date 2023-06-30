require('packer').startup(function()
    
    -- Package Manager
    use {
        'wbthomason/packer.nvim'
    } 

    -- Color Theme
    use {
        'tomasr/molokai'
    }
    
    -- Status Bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = [[ require('plugins/lualine') ]]
    }

    -- IDE
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow"
        },
        config = [[ require('plugins/treesitter') ]]
    }

    -- Fuzzy Search / Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'} 
        },
        config = [[ require('plugins/telescope') ]]
    }
    
    -- LSP Setup
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                  -- Optional
                'williamboman/mason.nvim',
                run = function()
                pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = [[ require('plugins/lsp') ]]
    }

    -- Git
    use{
        'tpope/vim-fugitive'
    }

end)

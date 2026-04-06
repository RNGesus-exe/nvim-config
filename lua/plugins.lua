-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000, -- load colorscheme first
        config = function()
            vim.o.termguicolors = true
            vim.cmd [[ colorscheme gruvbox ]]
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require("plugin_config.lualine") end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require("plugin_config.nvim-tree") end,
    },

    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',

    {
        'mbbill/undotree',
        config = function() require("plugin_config.undotree") end,
    },

    'tpope/vim-fugitive',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require("plugin_config.treesitter") end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("plugin_config.telescope") end,
    },
    {
    "amitds1997/remote-nvim.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
    },

    -- LSP + Completion
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            { 'saghen/blink.cmp', version = '*', dependencies = { 'rafamadriz/friendly-snippets' } },
        },
        config = function() require("plugin_config.lsp-zero") end,
    },
})

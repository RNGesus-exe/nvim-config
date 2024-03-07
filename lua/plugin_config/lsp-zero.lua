local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers
-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

-- Autocomplete

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<C-Space>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- Lsp Configurations
local keymap = vim.keymap -- for conciseness

-- set keybinds
opts = {}
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)       -- show definition, references

keymap.set("n", "gD", vim.lsp.buf.declaration, opts)       -- go to declaration

keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)       -- show lsp definitions

keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)       -- show lsp implementations

keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)       -- show lsp type definitions

keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)       -- see available code actions, in visual mode will apply to selection

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- smart rename

keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)       -- show  diagnostics for file

keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)       -- show diagnostics for line

keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)       -- jump to previous diagnostic in buffer

keymap.set("n", "]d", vim.diagnostic.goto_next, opts)       -- jump to next diagnostic in buffer

keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- show documentation for what is under cursor

keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)       -- mapping to restart lsp if necessary

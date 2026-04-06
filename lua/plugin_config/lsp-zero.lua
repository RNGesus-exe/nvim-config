-- Mason: manages LSP server installations
require('mason').setup()

-- Keymaps attached whenever an LSP connects to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        local keymap = vim.keymap

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end,
})

-- Wire up each installed server automatically via blink.cmp capabilities
local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason-lspconfig').setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
            })
        end,
    },
})

-- Completion (blink.cmp)
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<CR>']      = { 'accept', 'fallback' },
        ['<C-e>']     = { 'cancel', 'fallback' },
        ['<Up>']      = { 'select_prev', 'fallback' },
        ['<Down>']    = { 'select_next', 'fallback' },
        ['<C-Space>'] = { 'show', 'fallback' },
    },
    appearance = { use_nvim_cmp_as_default = false },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})

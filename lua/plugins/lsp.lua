local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    'clangd'
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

lsp.setup()

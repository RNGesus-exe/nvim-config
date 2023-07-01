local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    'clangd',
    'lua_ls',

})

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

lsp.setup()

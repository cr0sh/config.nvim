local lspconfig = require "lspconfig"

lspconfig.pyright.setup {
    on_attach = lsp_on_attach,
}

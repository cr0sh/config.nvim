local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    on_attach = LSP_ON_ATTACH,
})

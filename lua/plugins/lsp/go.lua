require("lspconfig").gopls.setup({
    on_attach = LSP_ON_ATTACH,
    settings = {
        gopls = {
            analyses = {
                composites = false,
            },
        },
    },
})

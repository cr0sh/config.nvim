vim.lsp.config("gopls", {
    on_attach = LSP_ON_ATTACH,
    settings = {
        gopls = {
            analyses = {
                composites = false,
            },
        },
    },
})

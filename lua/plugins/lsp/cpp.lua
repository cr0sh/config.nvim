require("lspconfig").clangd.setup({
    capabilities = {
        offsetEncoding = "utf-8",
    },
    on_attach = LSP_ON_ATTACH,
})

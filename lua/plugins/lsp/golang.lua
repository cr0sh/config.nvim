require("lspconfig").gopls.setup({
    on_attach = function(client, bufnr)
        LSP_ON_ATTACH(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
            end,
        })
    end,
})

require("lspconfig").metals.setup({
    on_attach = function(client, bufnr)
        LSP_ON_ATTACH(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
            end,
        })
    end,
})

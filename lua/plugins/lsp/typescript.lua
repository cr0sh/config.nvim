lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
    lsp_on_attach(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format { async = true } end
        })
    end
end

-- TypeScript
lspconfig["tsserver"].setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

local lspconfig = require "lspconfig"
local on_attach = function(client, bufnr)
    lsp_on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
local servers = {"zls"}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
    }
end

-- We use Trouble to show diagnostics, so disable included diagnostics
vim.g.zig_fmt_parse_errors = 0

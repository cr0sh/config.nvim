local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.isort,
    },
    on_attach = LSP_ON_ATTACH,
})

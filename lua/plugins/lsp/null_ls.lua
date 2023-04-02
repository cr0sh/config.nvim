local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.zigfmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
    },
})

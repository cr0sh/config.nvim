vim.lsp.config("rustaceanvim", {
    server = {
        on_attach = LSP_ON_ATTACH,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                check = {
                    command = "clippy",
                },
            },
        },
    },
})

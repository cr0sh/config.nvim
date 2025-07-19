local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    LSP_ON_ATTACH(client, bufnr)
end

-- TypeScript
vim.lsp.config("ts_ls", {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    -- cmd = { "bun", "typescript-language-server", "--stdio" },
    single_file_support = false,
    settings = {
        typescript = {
            format = {
                semicolons = "remove",
            },
        },
        javascript = {
            format = {
                semicolons = "remove",
            },
        },
    },
})

-- Deno
vim.lsp.config("denols", {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- ESLint
vim.lsp.config("eslint", {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("eslint.config.js"),
    settings = {
        -- https://github.com/LazyVim/LazyVim/issues/3383#issuecomment-2140686161
        useFlatConfig = true, -- set if using flat config
        experimental = {
            useFlatConfig = nil, -- option not in the latest eslint-lsp
        },
    },
})

-- Tailwind
vim.lsp.config("tailwindcss", {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("tailwind.config.js"),
})

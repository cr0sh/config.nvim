local lspconfig = require("lspconfig")

-- TypeScript
vim.lsp.config("ts_ls", {
    -- cmd = { "bun", "typescript-language-server", "--stdio" },
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
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- ESLint
vim.lsp.config("eslint", {
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
    root_dir = lspconfig.util.root_pattern("tailwind.config.js"),
})

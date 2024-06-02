local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    LSP_ON_ATTACH(client, bufnr)
end

-- TypeScript
lspconfig["tsserver"].setup({
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    cmd = { "pnpm", "typescript-language-server", "--stdio" },
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
lspconfig["denols"].setup({
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- ESLint
-- lspconfig["eslint"].setup({
--     on_attach = on_attach,
--     root_dir = lspconfig.util.root_pattern("package.json"),
--     settings = {
--         -- https://github.com/LazyVim/LazyVim/issues/3383#issuecomment-2140686161
--         useFlatConfig = true, -- set if using flat config
--         experimental = {
--             useFlatConfig = nil, -- option not in the latest eslint-lsp
--         },
--     },
-- })

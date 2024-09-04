local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

configs.solidity = {
    on_attach = LSP_ON_ATTACH,
    default_config = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
    },
}

lspconfig.solidity.setup({
    on_attach = LSP_ON_ATTACH,
})

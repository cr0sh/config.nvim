local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

configs.solidity = {
    on_attach = LSP_ON_ATTACH,
    default_config = {
        cmd = { "vscode-solidity-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.root_pattern("hardhat.config.js", "foundry.toml", ".git"),
        single_file_support = true,
        solidity = {
            compileUsingRemoteVersion = "latest",
            defaultCompiler = "remote",
            enabledAsYouTypeCompilationErrorCheck = true,
        },
    },
}

lspconfig.solidity.setup({
    on_attach = LSP_ON_ATTACH,
})

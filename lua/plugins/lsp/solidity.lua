local lspconfig = require("lspconfig")

vim.lsp.config("solidity_ls", {
    default_config = {
        cmd = { "vscode-solidity-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.root_pattern("hardhat.config.js", "foundry.toml", ".git"),
        single_file_support = true,
        solidity = {
            compileUsingRemoteVersion = "latest",
            defaultCompiler = "remote",
            enabledAsYouTypeCompilationErrorCheck = true,
            monoRepoSupport = false,
        },
    },
})

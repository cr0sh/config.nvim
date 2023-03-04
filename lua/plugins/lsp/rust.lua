require("crates").setup({
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
})

local on_init = function(client, bufnr)
    -- project-specific settings
    local path = client.workspace_folders[1].name

    local function path_ends_with(ending)
        assert(ending ~= "")
        return path:sub( -#ending) == ending
    end

    if path_ends_with("dev/personal/wasmtime") then
        client.config.settings["rust-analyzer"].cargo.features = { "wasmtime/cranelift" }
        client.config.settings["rust-analyzer"].cargo.extraEnv = { RUSTFLAGS = "--cfg=compiler" }
        client.config.settings["rust-analyzer"].checkOnSave.features = { "wasmtime/cranelift" }
        client.config.settings["rust-analyzer"].checkOnSave.extraEnv = { RUSTFLAGS = "--cfg=compiler" }
    elseif path_ends_with("dev/personal/wasynth") then
        client.config.settings["rust-analyzer"].cargo.features = { "bytes_trace " }
        client.config.settings["rust-analyzer"].checkOnSave.extraEnv = { "bytes_trace" }
    else
        return
    end

    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
end

require("lspconfig").rust_analyzer.setup({
    on_init = on_init,
    on_attach = LSP_ON_ATTACH, -- defined on lsp.lua
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy",
                extraEnv = { CARGO_TARGET_DIR = "target/rust-analyzer" },
            },
            cargo = {
                extraEnv = { CARGO_TARGET_DIR = "target/rust-analyzer" },
            },
        },
    },
})

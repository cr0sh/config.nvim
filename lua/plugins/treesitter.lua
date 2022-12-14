require("nvim-treesitter.configs").setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- enable indentation
    indent = { enable = false },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "rust",
        "toml",
        "lua",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "bash",
        "vim",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "zig",
    },
    -- auto install above language parsers
    auto_install = true,
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})

vim.keymap.set("n", "<leader>rr", "<Cmd>TSDisable rainbow|TSEnable rainbow<CR>")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core utilities
    { "nvim-lua/plenary.nvim", lazy = true },
    { "timonv/vim-cargo" },
    { "tpope/vim-surround" },
    { "vim-scripts/ReplaceWithRegister" },
    { "numToStr/Comment.nvim" },
    { "akinsho/toggleterm.nvim" },

    -- File explorer and UI
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-lualine/lualine.nvim" },
    { "akinsho/bufferline.nvim" },

    -- Session management
    { "rmagatti/auto-session" },

    -- LSP and Mason
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "mrcjkb/rustaceanvim" },
    { "glepnir/lspsaga.nvim" },
    {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters = {
                    rustfmt = {
                        prepend_args = { "+nightly" },
                    },
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "ruff", "isort", "black" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    javascript = { "prettierd", lsp_format = "fallback", stop_after_first = true },
                    typescript = { "prettierd", lsp_format = "fallback", stop_after_first = true },
                    solidity = { "forge_fmt", lsp_format = "fallback", stop_after_first = true },
                },
                format_after_save = {
                    lsp_format = "fallback",
                    timeout_ms = 3000,
                },
            })
        end,
    },

    -- Language support
    { "ziglang/zig.vim" },

    -- Telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope.nvim" },
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        config = function()
            require("telescope").load_extension("frecency")
        end,
    },

    -- Colorscheme
    {
        "cr0sh/one-nvim",
        config = function()
            vim.cmd([[colorscheme one-nvim]])
            vim.o.background = "light"
        end,
    },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "ray-x/lsp_signature.nvim" },

    -- Completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/vim-vsnip" },
    { "jose-elias-alvarez/typescript.nvim" },
    { "onsails/lspkind.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "windwp/nvim-autopairs" },
    { "hiphish/rainbow-delimiters.nvim" },
    { "nathanaelkane/vim-indent-guides" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    -- Git
    { "TimUntersberger/neogit" },
    { "lewis6991/gitsigns.nvim" },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({})
        end,
    },

    -- Editor config
    { "editorconfig/editorconfig-vim" },

    -- OpenCode
    {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            {
                "folke/snacks.nvim",
                priority = 1000,
                lazy = false,
                ---@type snacks.Config
                opts = {
                    bigfile = { enabled = true },
                    bufdelete = { enabled = true },
                    dashboard = { enabled = true },
                    explorer = { enabled = true },
                    indent = { enabled = true },
                    input = { enabled = true },
                    picker = { enabled = true },
                    notifier = { enabled = true },
                    terminal = { enabled = true },
                    quickfile = { enabled = true },
                    scope = { enabled = true },
                    -- scroll = { enabled = true },
                    statuscolumn = { enabled = true },
                    words = { enabled = true },
                },
            },
        },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {}

            vim.o.autoread = true

            vim.keymap.set({ "n", "x" }, "<C-a>", function()
                require("opencode").ask("@this: ", { submit = true })
            end, { desc = "Ask opencode…" })
            vim.keymap.set({ "n", "x" }, "<C-x>", function()
                require("opencode").select()
            end, { desc = "Execute opencode action…" })
            vim.keymap.set({ "n", "t" }, "<C-.>", function()
                require("opencode").toggle()
            end, { desc = "Toggle opencode" })

            vim.keymap.set({ "n", "x" }, "go", function()
                return require("opencode").operator("@this ")
            end, { desc = "Add range to opencode", expr = true })
            vim.keymap.set("n", "goo", function()
                return require("opencode").operator("@this ") .. "_"
            end, { desc = "Add line to opencode", expr = true })

            vim.keymap.set("n", "<S-C-u>", function()
                require("opencode").command("session.half.page.up")
            end, { desc = "Scroll opencode up" })
            vim.keymap.set("n", "<S-C-d>", function()
                require("opencode").command("session.half.page.down")
            end, { desc = "Scroll opencode down" })

            vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
            vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
        end,
    },
})

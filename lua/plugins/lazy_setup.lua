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
                    python = { "ruff_format", "isort", "black", stop_after_first = true },
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
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = "enter",
                ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false }, menu = { auto_show = true } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    { "jose-elias-alvarez/typescript.nvim" },
    { "onsails/lspkind.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "windwp/nvim-autopairs" },
    { "hiphish/rainbow-delimiters.nvim" },

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

    -- Snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        init = function()
            vim.api.nvim_create_autocmd("VimEnter", {
                once = true,
                callback = function()
                    vim.schedule(function()
                        local term = Snacks.terminal(nil, {
                            win = {
                                border = "none",
                                wo = {
                                    winbar = "",
                                },
                                keys = {
                                    esc = {
                                        "<Esc>",
                                        function(self)
                                            self:hide()
                                        end,
                                        mode = "t",
                                        desc = "Hide Terminal",
                                        noremap = true,
                                    },
                                    term_normal = false,
                                },
                            },
                        })
                        term:hide()
                        vim.cmd("stopinsert")
                    end)
                end,
            })
        end,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            bufdelete = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            terminal = {
                enabled = true,
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            keymap = { enabled = true },
            picker = { enabled = true },
            -- scroll = { enabled = true },
            statuscolumn = { enabled = true },
            -- words = { enabled = true },
        },
        keys = {
            {
                [[<C-\><C-\>]],
                function()
                    Snacks.picker.commands()
                end,
                desc = "Smart find commands",
            },
            {
                [[<C-\>s]],
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = "Smart find workspace commands",
            },
            {
                [[<C-\>f]],
                function()
                    Snacks.picker.files()
                end,
                desc = "Smart find workspace commands",
            },
            {
                [[<C-\>b]],
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Smart find buffers",
            },
            {
                [[<C-]>]],
                function()
                    Snacks.picker.notifications()
                end,
                desc = "Smart find notifications",
            },
            {
                [[t]],
                function()
                    vim.cmd([[Trouble diagnostics close]])
                    Snacks.terminal(nil, {
                        win = {
                            keys = {
                                esc = {
                                    "<Esc>",
                                    function(self)
                                        self:hide()
                                    end,
                                    mode = "t",
                                    desc = "Hide Terminal",
                                    noremap = true,
                                },
                                term_normal = false,
                            },
                        },
                    })
                end,
                desc = "Toggle terminal",
            },
        },
    },

    -- OpenCode
    {
        "NickvanDyke/opencode.nvim",
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
                local provider = require("opencode.config").provider
                ---@diagnostic disable-next-line
                if provider ~= nil and provider.get ~= nil and provider.name == "snacks" then
                    ---@diagnostic disable-next-line
                    local term = provider:get()
                    if term:win_valid() then
                        vim.api.nvim_set_current_win(term.win)
                    end
                end
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

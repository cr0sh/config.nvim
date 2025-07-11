local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
    return
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use("rcarriga/nvim-notify")
    use("timonv/vim-cargo")
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("numToStr/Comment.nvim")
    use("akinsho/toggleterm.nvim")

    use("nvim-tree/nvim-tree.lua")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")

    use("rmagatti/auto-session")

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("mrcjkb/rustaceanvim")
    use("glepnir/lspsaga.nvim")
    use({
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    })
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters = {
                    prettierd = {
                        require_cwd = true,
                    },
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
    })

    use("ziglang/zig.vim")
    use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
    use({
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension("frecency")
        end,
        requires = { "kkharji/sqlite.lua" },
    })

    use({
        "cr0sh/one-nvim",
        config = function()
            vim.cmd([[colorscheme one-nvim]])
            vim.o.background = "light"
        end,
    })

    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("ray-x/lsp_signature.nvim")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    -- Useful completion sources:
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/vim-vsnip")
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use("L3MON4D3/LuaSnip")
    use("windwp/nvim-autopairs")
    use("hiphish/rainbow-delimiters.nvim")
    use("nathanaelkane/vim-indent-guides")

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })

    use("TimUntersberger/neogit")

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use("lewis6991/gitsigns.nvim")
    use("editorconfig/editorconfig-vim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)

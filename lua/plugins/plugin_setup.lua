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

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugin_setup.lua source <afile> | PackerSync
augroup end]])

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
    use("voldikss/vim-floaterm")

    use("nvim-tree/nvim-tree.lua")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")

    use("rmagatti/auto-session")

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("simrat39/rust-tools.nvim")
    use("jayp0521/mason-null-ls.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("glepnir/lspsaga.nvim")
    use({
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    })

    use("ziglang/zig.vim")

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

    -- use "tanvirtin/monokai.nvim"
    use("navarasu/onedark.nvim")

    -- configuring lsp servers
    use("jose-elias-alvarez/null-ls.nvim")

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
    use("p00f/nvim-ts-rainbow")

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

    if packer_bootstrap then
        require("packer").sync()
    end
end)

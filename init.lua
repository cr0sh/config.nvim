-- Setup

require "plugins.plugin_setup"
require "impatient"
vim.notify = require "notify"

-- Settings

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wildignorecase = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.ff = "unix"
vim.opt.scrolloff = 4
vim.opt.encoding = "utf-8"
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.wo.signcolumn = "yes"
vim.cmd [[language en_US]]

-- (Global) Key mappings

vim.g.mapleader = ";"
-- vim.keymap.set("i", ";;", "<Esc>", { silent = true, noremap = true})

-- Workaround for notify.nvim
-- https://github.com/rcarriga/nvim-notify/issues/63
vim.opt.updatetime = 100
vim.opt.redrawtime = 1500
vim.opt.lazyredraw = true
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10


-- Plugins


require "plugins.util"
require "plugins.notify"

require "plugins.auto_session"
require "plugins.telescope"
require "plugins.nvim_tree"
require "plugins.nvim_cmp"
require "plugins.lualine"
require "plugins.onedark"
require "plugins.treesitter"
require "plugins.floaterm"
require "plugins.autopairs"
require "plugins.trouble"

require "plugins.lsp.lsp"
require "plugins.lsp.mason"
require "plugins.lsp.rust"
require "plugins.lsp.zig"
require "plugins.lsp.typescript"


-- Colorscheme


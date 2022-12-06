require("nvim-autopairs").setup()

-- https://github.com/windwp/nvim-autopairs/issues/90#issuecomment-889282516
vim.opt.viewoptions = { "folds", "cursor" }
-- Also remove "localoptions" from auto-session options
vim.opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal" }

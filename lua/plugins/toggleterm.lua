require("toggleterm").setup()
vim.keymap.set("n", "t", ":ToggleTerm size=20<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

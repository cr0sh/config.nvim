require("bufferline").setup()

vim.keymap.set("n", "<Leader>n", ":bnext<CR>")
vim.keymap.set("n", "<Leader>p", ":bprev<CR>")
vim.keymap.set("n", "<Leader>q", ":bp | bd #<CR>")

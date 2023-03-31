vim.api.nvim_create_autocmd(
    "TermEnter",
    { pattern = "term://*toggleterm#*", command = [[tnoremap <silent><Esc> <Cmd>exe v:count1 . "ToggleTerm"<CR>]] }
)
vim.keymap.set("n", "t", [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], { silent = true })

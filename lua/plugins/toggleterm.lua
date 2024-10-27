require("toggleterm").setup({ size = 20, auto_scroll = false, persist_size = false, persist_mode = false })

vim.api.nvim_create_autocmd(
    "TermEnter",
    { pattern = "term://*toggleterm#*", command = [[tnoremap <silent><Esc> <Cmd>exe v:count1 . "ToggleTerm"<CR>]] }
)
vim.keymap.set("n", "t", [[<Cmd>Trouble diagnostics close<CR><Cmd>exe v:count1 . "ToggleTerm"<CR>]], { silent = true })

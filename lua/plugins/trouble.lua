require("trouble").setup({ auto_preview = false })

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", { silent = true, noremap = true })

-- Trouble seems to have trouble with auto-session, so close when VimLeavePre
vim.api.nvim_create_autocmd("VimLeavePre", { command = [[Trouble diagnostics close]] })

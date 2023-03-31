local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

vim.g.loaded = 1
nvimtree.setup({
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", { command = [[NvimTreeClose]] })

vim.keymap.set("n", "<Space><Space>", ":NvimTreeFocus<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Space>q", ":NvimTreeClose<CR>", { silent = true, noremap = true })

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

vim.keymap.set("n", "<Space>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

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

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "NvimTree" },
    callback = function(args)
        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function()
                vim.api.nvim_buf_delete(args.buf, { force = true })
                return true
            end,
        })
    end,
})

vim.keymap.set("n", "<Space><Space>", ":NvimTreeFocus<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Space>q", ":NvimTreeClose<CR>", { silent = true, noremap = true })

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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "NvimTree*",
    callback = function()
        local view = require("nvim-tree.view")
        local is_visible = view.is_visible()

        local api = require("nvim-tree.api")
        if not is_visible then
            api.tree.open()
        end
    end,
})

vim.keymap.set("n", "<Space><Space>", ":NvimTreeFocus<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Space>q", ":NvimTreeClose<CR>", { silent = true, noremap = true })

local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        offsets = {
            filetype = "NvimTree",
            text = "File Explorer",
        },
    },
})

vim.keymap.set("n", "<Leader>n", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<Leader>p", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", ":bp | bd #<CR>", { silent = true })

vim.keymap.set("n", "<leader>1", function()
    bufferline.go_to_buffer(1, true)
end)
vim.keymap.set("n", "<leader>2", function()
    bufferline.go_to_buffer(2, true)
end)
vim.keymap.set("n", "<leader>3", function()
    bufferline.go_to_buffer(3, true)
end)
vim.keymap.set("n", "<leader>4", function()
    bufferline.go_to_buffer(4, true)
end)
vim.keymap.set("n", "<leader>5", function()
    bufferline.go_to_buffer(5, true)
end)
vim.keymap.set("n", "<leader>6", function()
    bufferline.go_to_buffer(6, true)
end)
vim.keymap.set("n", "<leader>7", function()
    bufferline.go_to_buffer(7, true)
end)
vim.keymap.set("n", "<leader>8", function()
    bufferline.go_to_buffer(8, true)
end)
vim.keymap.set("n", "<leader>9", function()
    bufferline.go_to_buffer(9, true)
end)
vim.keymap.set("n", "<leader>0", function()
    bufferline.go_to_buffer(10, true)
end)

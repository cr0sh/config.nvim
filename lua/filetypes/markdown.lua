vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("markdown_sw_is_2", { clear = true }),
    pattern = "markdown",
    command = "setlocal shiftwidth=2",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("markdown_wrap", { clear = true }),
    pattern = "markdown",
    command = "set wrap | set textwidth=80",
})

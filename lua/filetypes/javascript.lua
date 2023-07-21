vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("javascript_sw_is_2", { clear = true }),
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    command = "setlocal shiftwidth=2",
})

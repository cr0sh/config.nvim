vim.lsp.config("clangd", {
    capabilities = require("blink.cmp").get_lsp_capabilities({
        offsetEncoding = "utf-8",
    }),
})

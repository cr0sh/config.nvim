lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	LSP_ON_ATTACH(client, bufnr)
end

-- TypeScript
lspconfig["tsserver"].setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

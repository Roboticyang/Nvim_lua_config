-- Use the handlers to take care of entire setups
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.lsp.set_log_level("info")

require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = false,
	handlers = nil,
})

require("lsp-config.mason-lspconfig.mason-lsp-installer")
require("lsp-config.mason-lspconfig.handlers").setup()

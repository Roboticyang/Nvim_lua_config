-- Use the handlers to take care of entire setuos
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp-config.lsp-installer.lsp-installer")
require("lsp-config.lsp-installer.handlers").setup()

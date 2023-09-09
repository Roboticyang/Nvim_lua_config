local status_ok, mason_lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_2_ok, lsp_config = pcall(require, "lspconfig")
if not status_2_ok then
	return
end

local servers = mason_lsp_installer.get_installed_servers()

local function handle_generator(server)
	local opts = {
		on_attach = require("lsp-config.mason-lspconfig.handlers").on_attach,
		capabilities = require("lsp-config.mason-lspconfig.handlers").capabilities,
	}

	if server == "lua_ls" then
	local lua_ls_opts = require("lsp-config.mason-lspconfig.settings.lua_ls")
	opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end

	if server == "pyright" then
	local pyright_opts = require("lsp-config.mason-lspconfig.settings.pyright")
	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "texlab" then
	local tex_lab_opts = require("lsp-config.mason-lspconfig.settings.texlab")
	opts = vim.tbl_deep_extend("force", tex_lab_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	return opts
end

mason_lsp_installer.setup_handlers({
	-- default optional function, 
	-- function ()
	--		For some reason, to unpack the loops in default is not working
	--		For some reason, to run the lspconfig ls setup is not working
	-- end,
	-- customized handle in table format, it only works by calling lsp-config here
	[servers[1]] = lsp_config[servers[1]].setup(handle_generator(servers[1])),
	[servers[2]] = lsp_config[servers[2]].setup(handle_generator(servers[2])),
	[servers[3]] = lsp_config[servers[3]].setup(handle_generator(servers[3])),
})


local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.black,
	formatting.markdownlint,
	-- diagnostics.luacheck,
	diagnostics.pylint,
	diagnostics.markdownlint,
}

null_ls.setup({
	sources = sources
})

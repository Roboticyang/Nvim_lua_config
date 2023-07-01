local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.black,
	formatting.markdownlint,
	formatting.latexindent,
	diagnostics.pylint,
	diagnostics.chktex,
	diagnostics.markdownlint,
}

null_ls.setup({
	sources = sources
})

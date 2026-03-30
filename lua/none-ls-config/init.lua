local none_ls = require('null-ls')

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

local sources = {
	formatting.black,
	formatting.markdownlint,
	diagnostics.pylint,
	diagnostics.markdownlint,

	-- following two setup has issues.
	-- diagnostics.pyright,
	-- diagnostics.chktex,
	-- formatting.latexindent,
}

none_ls.setup({
	sources = sources,
	log_level = "info",
})

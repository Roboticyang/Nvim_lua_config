require('lint').linters_by_ft = {
	python = { 'pylint' },
}

-- Auto-trigger linting on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

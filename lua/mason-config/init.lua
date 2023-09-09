-- example mason settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
		-- keymaps = {},
		-- check_outdated_packages_on_open = true,
		-- border = "none",
		-- width = 0.8,
		-- height = 0.9
	},
	log_level = vim.log.levels.INFO,  -- use DEBUG to log errros msg
})

require 'notify'.setup(
	{
		background_colour = "Normal",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = ""
		},
		level = 2,
		-- minimum_width = 50,
		render = "minimal",
		stages = "fade",
		timeout = 4000,
		max_width = 30,
		max_height = 6,
		border = "rounded",
	}
)

vim.notify = require("notify")

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
		render = "default",
		stages = "fade_in_slide_out",
		timeout = 4000,
		max_width = 60,
		max_height = 20,
		border = "rounded",
	}
)

vim.notify = require("notify")
require('telescope').load_extension("notify")

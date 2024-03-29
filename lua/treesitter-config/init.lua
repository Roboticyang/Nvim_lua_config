require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'python',
		'lua',
		'cpp',
	},

	sync_install = false,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<A-*>",
				goto_previous_usage = "<A-#>",
			},
		},
	},
}

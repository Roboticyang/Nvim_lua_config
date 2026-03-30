local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({ "python", "lua", "cpp", "latex", "vim", "vimdoc" })  -- no query support now. TSInstall failed

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "cpp", "tex", "latex", "vim" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "cpp" },
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- following is depreciated together with the ts-refactor package
-- require'nvim-treesitter.configs'.setup {
-- 	ensure_installed = {
-- 		'python',
-- 		'lua',
-- 		'cpp',
-- 	},
--
-- 	sync_install = false,
-- 	autopairs = {
-- 		enable = true,
-- 	},
-- 	highlight = {
-- 		enable = true,
-- 		disable = { "latex" },
-- 		additional_vim_regex_highlighting = false,
-- 	},
-- 	refactor = {
-- 		highlight_definitions = {
-- 			enable = true,
-- 			clear_on_cursor_move = true,
-- 		},
-- 		smart_rename = {
-- 			enable = true,
-- 			keymaps = {
-- 				smart_rename = "grr",
-- 			},
-- 		},
-- 		navigation = {
-- 			enable = true,
-- 			keymaps = {
-- 				goto_definition = "gnd",
-- 				list_definitions = "gnD",
-- 				list_definitions_toc = "gO",
-- 				goto_next_usage = "<A-*>",
-- 				goto_previous_usage = "<A-#>",
-- 			},
-- 		},
-- 	},
-- }

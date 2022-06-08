local ls = require("luasnip") --{{{
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Python Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}
	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

local sheBang = s(-- python header snippets {{{
	"sheBangr",
	fmt(
		[[
#!/usr/bin/{}
# -*- coding: utf-8 -*-
"""{}
	Author: {}
	Created: {}
	Modification: {}
	Version: {}"""


{}


{}
	]],
		{
			c(1, { t("python3"), t("env python") }),
			i(2, "YourDocStringHere"),
			i(3, "Yang Wang @ U of Waterloo Maglev lab"),
			i(4, os.date()),
			i(5, "Major feature update from previous version"),
			i(6, "0.0"),
			i(7, "# Your import goes here"),
			i(8, "# Your codes goes here"),
		}
	)
) -- }}}
table.insert(snippets, sheBang)

cs(-- Create class snippets {{{
	{ trig = "cl(%w+)", regTrig = true, hidden = true },
	fmt(
		[[
class {}({}):
	"""
	{}
	"""

	def __init__(self, {}):
		self.{} = {}

	{}
		]],
		{
			d(1, function(_, snip)
				return sn(1, i(1, snip.captures[1]))
			end),
			c(2, { i(1, "ParentClass"), t("Object"), t("") }),
			i(3, "DocString"),
			i(4, "var_name"),
			rep(4),
			rep(4),
			i(7),
		}
	)
) --}}}

cs(-- Create Function snippets {{{
	{ trig = "df([%w_]+)", regTrig = true, hidden = true },
	fmt(
		[[
def {}({}):
	"""
	{}
	"""
	{}

{}
		]],
		{
			d(1, function(_, snip)
				return sn(1, i(1, snip.captures[1]))
			end),
			c(2, { i(1, "my_arg"), t("") }),
			i(3, "DocString"),
			i(4, "pass"),
			i(5),
		}
	)
) --}}}

cs(-- Create Function in class snippets {{{
	{ trig = "def([%w_]*)", regTrig = true, hidden = true },
	fmt(
		[[
	def {}(self, {}):
		"""
		{}
		"""
		{}

	{}
		]],
		{
			d(1, function(_, snip)
				return sn(1, i(1, snip.captures[1]))
			end),
			i(2, "my_var"),
			i(3, "Docstring"),
			i(4, "pass"),
			i(5),
		}
	)

) --}}}

-- End Refactoring --

return snippets, autosnippets

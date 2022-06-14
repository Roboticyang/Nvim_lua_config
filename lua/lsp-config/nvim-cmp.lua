-- luasnip setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
	-- the ziontee113 choice here
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<A-o>'] = cmp.mapping.select_prev_item(),
    ['<A-i>'] = cmp.mapping.select_next_item(),
    ['<A-u>'] = cmp.mapping.confirm({ select = true }),

    ['<C-e>'] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),

    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ['<CR>'] = cmp.mapping.confirm {
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  --   format = lspkind.cmp_format({
  -- formatting = {
  --     with_text = true,
  --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

  --     -- The function below will be called before any actual modifications from lspkind
  --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
  --     before = function (entry, vim_item)
  --       return vim_item
  --     end
  --   })
  -- },
  formatting = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		-- Kind icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		vim_item.menu = ({
			nvim_lsp = "[LSP]",
			nvim_lua = "[NVim Lua]",
			luasnip = "LuaSnip",
			buffer = "[Buffer]",
			path = "[Path]",
		})[entry.source.name]
		return vim_item
	end,
  },
  sources = {
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lua' },
	{ name = 'luasnip' },
	{ name = 'buffer' },
	{ name = 'path' },
  },
  confirm_opts = {
	  behavior = cmp.ConfirmBehavior.Replace,
	  select = false,
  },
}

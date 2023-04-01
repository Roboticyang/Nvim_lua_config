-- following code deprecated
-- vim.g.bufferline = {
--   -- Enable/disable animations
--   animation = true,
--
--   -- Enable/disable close button
--   closable = true,
--
--   -- Configure icons on the bufferline.
--   icon_separator_active = '',
--   icon_separator_inactive = '',
-- }

-- use following instead
require'barbar'.setup {
	animation = true,
	clickable = true, -- key words updated
	icons = {
		separator = {left = ''}, -- this is the active
		inactive = {
			separator = {left = ''},
		},
	},
}

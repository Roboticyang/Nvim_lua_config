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
require'barbar'.setup {
	icons = {
		separator = {left = ''},
		inactive = {separator = {left = ''}},
	},
	animation = true,
	clickable = true,
}

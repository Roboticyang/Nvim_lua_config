-- lua neovim packer configs

require('settings')
require('keymappings')
require('packer-config')
require('color-config.nightfox')
require('nvim-tree-config')
require('nvim-notify-config')
require('lsp-config.nvim-cmp')
require('lsp-config.luasnip')
require('lsp-config.lsp-installer')
require('lualine-config')
require('barbar-config')
require('treesitter-config')
require('telescope-config')
require('autopairs-config')
require('toggleterm-config')
require('comment-config')
require('null-ls-config')

-- Vimtex is loaded for FileType tex only.
-- There is conflict with treesitter.
require('vimtex-config')
-- -- The following language servers config setup is migrated to lsp-installer
-- require('lsp-config.language-servers')

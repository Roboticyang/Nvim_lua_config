-- lua neovim packer configs

require('settings')
require('keymappings')
require('packer-config')
require('color-config.nightfox')
require('nvim-tree-config')
require('nvim-notify-config')
require('lsp-config.nvim-cmp')
require('lsp-config.luasnip')
require('lualine-config')
require('barbar-config')
require('treesitter-config')
require('telescope-config')
require('autopairs-config')
require('toggleterm-config')
require('comment-config')
require('null-ls-config')

-- require('lsp-config.lsp-installer')
-- Vimtex is loaded for FileType tex only.
-- There is conflict with treesitter.
require('vimtex-config')

-- latexfmt for latex
require('latexfmt_config')
-- -- The following language servers config setup is migrated to lsp-installer
-- require('lsp-config.language-servers')

-- setup mason-lspconfig, to load it mason must be loaded firt.
require("mason-config")
require("lsp-config.mason-lspconfig")

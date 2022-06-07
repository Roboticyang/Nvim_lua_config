return require 'packer'.startup(function()
	use 'wbthomason/packer.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'onsails/lspkind.nvim' -- VScode like pictograms to nvim-lsp builtin

	use 'rcarriga/nvim-notify' -- notify neovim message system optional
	use 'nvim-lualine/lualine.nvim' -- lualine
	use 'romgrk/barbar.nvim' -- barbar
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- treesitter
	use 'nvim-treesitter/nvim-treesitter-refactor' -- refactor based on treesitter
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'windwp/nvim-autopairs'
	use { "akinsho/toggleterm.nvim", config = function()
		require("toggleterm").setup()
	end }
	use { 'numToStr/Comment.nvim', config = function()
		require('Comment').setup()
	end }

	use 'jose-elias-alvarez/null-ls.nvim'
end)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

--	Modes
--		normal_mode = "n"
--		insert_mode = "i"
--		visual_mode = "v"
--		visual_block_mode = "x"
--		term_mode = "t"
--		command_mode = "c"

-- Normal --
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- <CR> means character return = enter
map('n', '<leader>q', ':q!<CR>', opts) -- <CR> means character return = enter
map('n', '<leader>sp', ':sp | term<CR>', opts) -- open terminal in horizontal split
map('n', '<leader>vs', ':vs | term<CR>', opts) -- open terminal in vertical split

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<S-Up>', ':resize +2<CR>', opts)
map('n', '<S-Down>', ':resize -2<CR>', opts)
map('n', '<S-Left>', ':vertical resize -2<CR>', opts)
map('n', '<S-Right>', ':vertical resize +2<CR>', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<S-s>', ':wq<CR>', opts)

-- This is the vimtex forward search k-map
map('n', '<leader>gl', ':VimtexView<CR>', opts)
map('n', '<leader>lf', '<Plug>latexfmt_format', opts)

-- Navigate buffers
-- map('n', '<S-l>', ':bnext<CR>', opts)
-- map('n', '<S-h>', ':bprevious<CR>', opts)

-- Insert --
map('i', 'jk', '<ESC>', opts)

-- Visual --
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- move text up and down
map('v', '<A-j>', ":m .+1<CR>==", opts)
map('v', '<A-k>', ":m .-2<CR>==", opts)

map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode --
map('t', '<ESC>', [[<C-\><C-n>]], opts) -- exit the terminal mode to normal mode using ESC

-- barbar keybindings
-- Move to previous/next
map('n', '<C-,>', ':BufferPrevious<CR>', opts)
map('n', '<C-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ':BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader><C-1>', ':BufferGoto 1<CR>', opts)
map('n', '<leader><C-2>', ':BufferGoto 2<CR>', opts)
map('n', '<leader><C-3>', ':BufferGoto 3<CR>', opts)
map('n', '<leader><C-4>', ':BufferGoto 4<CR>', opts)
map('n', '<leader><C-5>', ':BufferGoto 5<CR>', opts)
map('n', '<leader><C-6>', ':BufferGoto 6<CR>', opts)
map('n', '<leader><C-7>', ':BufferGoto 7<CR>', opts)
map('n', '<leader><C-8>', ':BufferGoto 8<CR>', opts)
map('n', '<leader><C-9>', ':BufferGoto 9<CR>', opts)
map('n', '<leader><C-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<S-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- telescope mappings
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

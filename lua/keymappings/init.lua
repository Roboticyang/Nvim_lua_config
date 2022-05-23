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
map('n', '<leader>sp', ':sp | term<CR>', opts) -- open terminal in horizontal split
map('n', '<leader>vs', ':vs | term<CR>', opts) -- open terminal in vertical split

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<A-s>', ':wq<CR>', opts)

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
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
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

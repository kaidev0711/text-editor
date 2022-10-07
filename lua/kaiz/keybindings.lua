local utils = require('kaiz.utils')

local keymap = vim.keymap.set
local opts = { silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


--NvimTree
utils.nnoremap('\\', ':NvimTreeToggle<CR>')

-- Better paste
utils.vnoremap("p", '"_dP')

-- Change Panes
utils.nnoremap('<C-l>', '<C-w>l')
utils.nnoremap('<C-h>', '<C-w>h')
utils.nnoremap('<C-j>', '<C-w>j')
utils.nnoremap('<C-k>', '<C-w>k')

-- Visual mode blockwise indent
utils.vnoremap('>', '>gv')
utils.vnoremap('<', '<gv')


-- ESC
utils.inoremap('jk', '<Esc>')
utils.inoremap('kj', '<Esc>')

-- Arrow Keys disabled normal mode
utils.nnoremap('<Up>', '<Nop>')
utils.nnoremap('<Down>', '<Nop>')
utils.nnoremap('<Left>', '<Nop>')
utils.nnoremap('<Right>', '<Nop>')

--nohm
utils.nnoremap('<leader>h', ':nohl<CR>')


-- BufferLine
utils.nnoremap('<S-l>', ':bnext<CR>') 
utils.nnoremap('<S-h>', ':bprevious<CR>')

--split
utils.nnoremap('<leader>--', ':split<CR>')
utils.nnoremap('<leader>//', ':vsplit<CR>')
--close buffer
utils.nnoremap('<S-q>', ':Bdelete!<CR>')


utils.nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
utils.nnoremap("<leader>fp", ":Telescope projects<CR>")

utils.nnoremap("<leader>8",":SymbolsOutline<CR>")


-- Move selected line / block of text in visual mode
utils.xnoremap("K", ":move '<-2<CR>gv-gv")
utils.xnoremap("J", ":move '>+1<CR>gv-gv")

-- utils.nnoremap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
--
-- utils.nnoremap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")

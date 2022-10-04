local utils = require('kaiz.utils')

vim.g.mapleader = ' '
--NvimTree
utils.nnoremap('\\', ':NvimTreeToggle<CR>')

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





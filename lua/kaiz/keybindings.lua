local utils = require('kaiz.utils')

local keymap = vim.keymap.set
local opts = { silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap('n', '<C-a>', 'gg<S-v>G')

--NvimTree
utils.nnoremap('<leader>e', ':NvimTreeToggle<CR>')

-- Better paste
utils.vnoremap("p", '"_dP')



-- Resize with arrows
-- utils.nnoremap("<C-J>", ":resize +2<CR>")
-- utils.nnoremap("<C-H>", ":vertical resize -2<CR>")
-- utils.nnoremap("<C-L>", ":vertical resize +2<CR>")
-- utils.nnoremap("<C-K>", ":resize -2<CR>")


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


--close buffer
utils.nnoremap('<S-q>', ':Bdelete!<CR>')


utils.nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
utils.nnoremap("<leader>fp", ":Telescope projects<CR>")


--symbols  outline
utils.nnoremap("<F8>",":SymbolsOutline<CR>")


-- Move selected line / block of text in visual mode
utils.xnoremap("K", ":move '<-2<CR>gv-gv")
utils.xnoremap("J", ":move '>+1<CR>gv-gv")


-- Comment
utils.nnoremap("<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
utils.xnoremap("<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')


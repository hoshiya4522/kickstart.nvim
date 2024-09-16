vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-j>', '<ESC>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<ESC>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<TAB>', ':bNext<CR>')
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>q', ':bdelete<CR>')

vim.keymap.set('n', '<leader>pv', ':Ex<CR>')

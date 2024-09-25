-- Mandatory keymap
vim.keymap.set('i', 'jk', '<ESC>')

-- Move code line/blocks with alt+{h,j,k,l}
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-j>', '<ESC>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<ESC>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Move through buffers
vim.keymap.set('n', '<TAB>', ':bNext<CR>')
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>q', ':bdelete<CR>', { desc = 'Buffer delete' })

-- [P]roject [V]iew.
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = '[P]roject [V]iew' })

-- Resize vertical splits (width) with Ctrl+A+h and Ctrl+A+l
vim.api.nvim_set_keymap('n', '<C-A-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Resize horizontal splits (height) with Ctrl+A+j and Ctrl+A+k
vim.api.nvim_set_keymap('n', '<C-A-j>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-k>', ':resize -2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<S-h>', '{', { noremap = true })
vim.keymap.set('n', '<S-l>', '}', { noremap = true })

vim.keymap.set('n', 's', ':w<CR>', { noremap = true })
vim.keymap.set('i', '<C-s>', '<ESC>:wa<CR>a', { noremap = true })

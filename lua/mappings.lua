local function map(mode, key, command, options)
    vim.api.nvim_set_keymap(mode, key, command, options)
end
local o = {}
o.n = { noremap = true }
o.ns = { noremap = true, silent = true }

-- Leader
map('n', '<Space>', '<NOP>', o.ns)

vim.g.mapleader = ' '

-- Toggle search hightlight
-- map('n', '<Leader>h', ':set hlsearch!<CR>', o.ns)

-- Telescope
-- map('n', '<Leader>p', '<cmd>Telescope find_files<CR>', o.ns)

-- Better indenting
map('v', '<', '<gv', o.ns)
map('v', '>', '>gv', o.ns)

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', o.ns)
map('x', 'J', ':move \'>+1<CR>gv-gv', o.ns)

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-j>", ":m .+1<CR>==", o.ns)
map("n", "<A-k>", ":m .-2<CR>==", o.ns)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", o.ns)

map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", o.ns)
map("x", "<A-j>", ":m '>+1<CR>gv-gv", o.ns)
map("x", "<A-k>", ":m '<-2<CR>gv-gv", o.ns)

-- Buffer movement
-- map('n', '<TAB>', ':bnext<CR>', o.ns)
-- map('n', '<S-TAB>', ':bprevious<CR>', o.ns)
map('n', '<TAB>', ':BufferNext<CR>', o.ns)
map('n', '<S-TAB>', ':BufferPrevious<CR>', o.ns)
map('n', '<Leader>w', ':BufferClose<CR>', o.ns)
-- map('n', '<Leader>c', ':bdelete<CR>', o.ns)

-- Add Line
map('n', 'J', 'o<Esc>', o.ns)
map('n', 'K', 'O<Esc>', o.ns)

-- Force quit
map('n', ':Q', ':qa!', o.n)

-- Dashboard
-- map('n', '<Leader>df', ':DashboardFindFile<CR>', o.ns)

-- Quit
map('n', '<C-q>', ':q<CR>', o.ns)

-- Save
map('n', '<C-s>', ':w!<CR>', o.ns)

-- ESC alt
map('i', 'jj', '<ESC>', o.ns)

-- Folding

-- Explorer
-- map('n', '<Leader>e', ':NvimTreeToggle<CR>', o.ns)
map('n', '<Leader>r', ':NvimTreeRefresh<CR>', o.ns)
map('n', '<Leader>br', ':e!<CR>', o.ns)
map('n', '<Leader>by', ':e!<CR>ggVGy', o.ns)

-- Yank/Cut/Put
map('v', '<C-c>', '"+y', o.ns)
map('v', '<C-x>', '"+x', o.ns)
-- map('n', '<C-V>', '"+gP', o.ns)
map('i', '<C-v>', '<Esc>"+gPa', o.ns)

-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

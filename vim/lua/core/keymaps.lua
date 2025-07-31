-- ========================================
-- Keymaps
-- ========================================

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable spacebar's default behavior
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>')

-- Move through wrapped lines
vim.keymap.set('n', 'k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true })
vim.keymap.set('n', 'j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Save without formatting
vim.keymap.set('n', '<leader>sn', ':noautocmd w<CR>')

-- Quit file
vim.keymap.set('n', '<C-q>', ':q<CR>')

-- Delete without yanking
vim.keymap.set('n', 'x', '"_x')

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>')
vim.keymap.set('n', '<Down>', ':resize +2<CR>')
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>')

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>sb', ':buffers<CR>:buffer<Space>')

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>')
vim.keymap.set('n', '<leader>-', '<C-x>')

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<leader>h', '<C-w>s')
vim.keymap.set('n', '<leader>se', '<C-w>=')
vim.keymap.set('n', '<leader>xs', ':close<CR>')

-- Split navigation
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Tab management
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')

vim.keymap.set('n', '<leader>x', ':bdelete<CR>')
vim.keymap.set('n', '<leader>b', ':enew<CR>')

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', function()
  vim.opt.wrap = not vim.opt.wrap
end, { desc = "Toggle wrap" })

-- Exit insert mode
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP')

-- System clipboard yank
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y')

-- File explorer
vim.keymap.set('n', '<leader>e', ':Lex<CR>', { silent = true })

-- ========================================
-- Other Settings
-- ========================================

-- Syntax highlighting
vim.cmd('syntax on')

-- Colorscheme
vim.cmd('colorscheme wildcharm')
vim.opt.background = 'dark'

-- Clipboard sync
if vim.fn.system('uname -s') == "Darwin\n" then
  vim.opt.clipboard = 'unnamed' -- OSX
else
  vim.opt.clipboard = 'unnamedplus' -- Linux
end

-- True colors
if not vim.g.gui_running and vim.o.term:match('screen') or vim.o.term:match('tmux') then
  vim.o.t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
  vim.o.t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"
end
vim.opt.termguicolors = true

-- Cursor shape
vim.o.t_SI = "\\e[6 q"  -- Insert mode: line cursor
vim.o.t_EI = "\\e[2 q"  -- Normal mode: block cursor

-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

-- Netrw keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  group = vim.api.nvim_create_augroup('netrw_setup', {}),
  callback = function()
    vim.keymap.set('n', 'l', '<CR>', { buffer = true })
  end
})

-- ========================================
-- Keymaps
-- ========================================

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable spacebar's default behavior
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

-- Clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- Save file with Cmd+S (macOS)
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })

-- Select All
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Undo
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true })

-- Normal mode: Paste from clipboard after cursor
vim.keymap.set("n", "<C-v>", '"+P', { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", '<C-o>"+P', { noremap = true, silent = true })
vim.keymap.set("x", "<C-v>", '"_d"+P', { noremap = true, silent = true })

-- Quit file
vim.keymap.set("n", "<C-q>", ":q<CR>")

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>x", ":bdelete<CR>")
vim.keymap.set("n", "<leader>b", ":enew<CR>")

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", function()
	vim.opt.wrap = not vim.opt.wrap
end, { desc = "Toggle wrap" })

-- System clipboard yank
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')

-- File explorer
vim.keymap.set("n", "<leader>e", ":Lex<CR>", { silent = true })

-- ========================================
-- Other Settings
-- ========================================

-- Syntax highlighting
vim.cmd("syntax on")

-- Clipboard sync
if vim.fn.system("uname -s") == "Darwin\n" then
	vim.opt.clipboard = "unnamed" -- OSX
else
	vim.opt.clipboard = "unnamedplus" -- Linux
end

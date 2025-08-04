-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })

-- Select All
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true })

-- Normal mode: Paste from clipboard after cursor
vim.keymap.set("n", "<C-v>", '"+P', { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", '<C-o>"+P', { noremap = true, silent = true })
vim.keymap.set("x", "<C-v>", '"_d"+P', { noremap = true, silent = true })

-- Quit file
vim.keymap.set("n", "<C-q>", ":q<CR>")

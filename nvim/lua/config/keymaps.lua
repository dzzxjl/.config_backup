-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
-- 在Normal Mode下
vim.keymap.set('n', '<D-c>', '"+y', { desc = 'Copy to System Clipboard' })
vim.keymap.set('v', '<D-c>', '"+y', { desc = 'Copy to System Clipboard' })
vim.keymap.set('n', '<D-v>', '"+p', { desc = 'Paste from System Clipboard' })
vim.keymap.set('v', '<D-v>', '"+p', { desc = 'Paste from System Clipboard' })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>bt", function()
  vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0
end, { desc = "Toggle tabline" })

vim.keymap.set("n", "}", "}zz", { desc = "Center after jump" })
vim.keymap.set("n", "{", "{zz", { desc = "Center after jump" })

vim.keymap.set("n", "UU", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "II", "2gt", { desc = "Go to tab 2" })
vim.keymap.set("n", "OO", "3gt", { desc = "Go to tab 3" })
vim.keymap.set("n", "JJ", "4gt", { desc = "Go to tab 4" })
vim.keymap.set("n", "KK", "5gt", { desc = "Go to tab 5" })
vim.keymap.set("n", "LL", "6gt", { desc = "Go to tab 6" })
vim.keymap.set("n", "MM", "7gt", { desc = "Go to tab 7" })
vim.keymap.set("n", "<<", "8gt", { desc = "Go to tab 8" })
vim.keymap.set("n", ">>", "9gt", { desc = "Go to tab 9" })

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", function()
  vim.g.md_preview_active = not vim.g.md_preview_active
  vim.cmd("MarkdownPreviewToggle")
end, { desc = "Toggle Markdown Preview" })

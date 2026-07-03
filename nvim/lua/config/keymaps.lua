-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---@diagnostic disable-next-line: undefined-global

vim.keymap.set("n", "<leader>bt", function()
  vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0
end, { desc = "Toggle bufferline" })

vim.keymap.set("n", "}", "}zz", { desc = "Toggle bufferline" })
vim.keymap.set("n", "{", "{zz", { desc = "Toggle bufferline" })

vim.keymap.set("n", "UU", "1gt", { desc = "Travel tab [N]" })
vim.keymap.set("n", "II", "2gt", { desc = "Travel tab [2]" })
vim.keymap.set("n", "OO", "3gt", { desc = "Travel tab [3]" })
vim.keymap.set("n", "JJ", "4gt", { desc = "Travel tab [4]" })
vim.keymap.set("n", "KK", "5gt", { desc = "Travel tab [5]" })
vim.keymap.set("n", "LL", "6gt", { desc = "Travel tab [6]" })
vim.keymap.set("n", "MM", "7gt", { desc = "Travel tab [7]" })
vim.keymap.set("n", "<<", "8gt", { desc = "Travel tab [8]" })
vim.keymap.set("n", ">>", "9gt", { desc = "Travel tab [9]" })

-- Function to clear terminal scrollback buffer
local function clear_term_scrollback()
  -- Only run if the current buffer is a terminal
  if vim.bo.buftype == "terminal" then
    vim.opt_local.scrollback = 100
    vim.defer_fn(function()
      vim.opt_local.scrollback = 100000
    end, 10)
  end
end

-- Keymap for Normal Mode (n) when inside a terminal window
vim.keymap.set("n", "<Leader>tc", function()
  clear_term_scrollback()
end, { desc = "Clear terminal scrollback" })

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", function()
  vim.g.md_preview_active = not vim.g.md_preview_active
  vim.cmd("MarkdownPreviewToggle")
end, { desc = "Toggle Markdown Preview" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NFM:h14"
  vim.g.neovide_fullscreen = true
  vim.g.neovide_scroll_animation_length = 0.15
end

-- Disable animations when entering the terminal
--[[ 
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
  end,
})

-- Restore animations when leaving the terminal
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  pattern = "term://*",
  callback = function()
    vim.g.neovide_cursor_animation_length = cursor_speed
    vim.g.neovide_scroll_animation_length = scroll_speed
  end,
})
--
--
--]]

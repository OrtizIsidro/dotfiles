-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NFM:h14"
  vim.g.neovide_fullscreen = true
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_opacity = 0.9
end

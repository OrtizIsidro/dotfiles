-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- Non-current windows
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- Disable line numbers(default to false)
vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.signcolumn = "no"

vim.opt.statuscolumn = ""

vim.opt.clipboard = "unnamedplus"

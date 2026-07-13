return {
  -- Hide the statusline plugin
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  -- Tell Neovim to never show the global statusline
  {
    "LazyVim/LazyVim",
    opts = {
      options = {
        laststatus = 0,
      },
    },
  },
  -- Disable bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
}

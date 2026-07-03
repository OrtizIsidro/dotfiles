return {
  -- 1. Agregamos el plugin del tema
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    keys = { { "<leader>up", "<cmd>MonokaiProSelect<cr>", desc = "Select Monokai Pro Filter" } },
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum", -- puedes usar: classic, octagon, pro, machine, ristretto, spectrum
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  },

  -- 2. Configuramos LazyVim para que lo use por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro", -- El nombre exacto que usa el plugin
    },
  },
}

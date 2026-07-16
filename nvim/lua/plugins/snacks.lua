return {
  "folke/snacks.nvim",
  opts = {
    animate = { enabled = false },
    scroll = { enabled = false },
    picker = {
      exclude = {
        "node_modules",
        ".git",
        ".cache",
        "dist",
      },
      layout = {
        preset = "ivy",
        layout = {
          box = "vertical",
          width = 0.8,
          min_width = 80,
          height = 0.8,
          border = "rounded",
        },
      },
      sources = {
        explorer = {
          layout = {
            preset = "ivy",
            width = 0.8,
            height = 0.8,
          },
          jump = {
            close = true,
          },
        },
      },
    },
  },
}

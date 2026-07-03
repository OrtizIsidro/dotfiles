return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      exclude = {
        "node_modules",
        ".git",
        ".cache",
        "dist",
      },
      layout = {
        preset = "ivy", -- Options: "default", "dropdown", "ivy", "telescope"
        -- Customize layout details
        layout = {
          box = "vertical",
          width = 0.8,
          min_width = 80,
          height = 0.8,
          border = "rounded", -- "none", "single", "double", "rounded"
        },
      },
      sources = {
        explorer = {
          -- Use a centered layout preset instead of the default sidebar
          layout = {
            preset = "ivy", -- Try "dropdown" or "default" for different centered looks
            -- Optional: further refine the float dimensions
            width = 0.8,
            height = 0.9,
          },
          jump = {
            close = true,
          },
        },
      },
      scroll = { enabled = false },
    },
  },
}

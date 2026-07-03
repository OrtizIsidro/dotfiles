return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && npx --yes yarn install",
  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_combine_preview = 1
    vim.g.md_preview_active = false
  end,
  config = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.md",
      callback = function()
        if vim.g.md_preview_active then
          vim.cmd("MarkdownPreview")
        end
      end,
    })
  end,
}


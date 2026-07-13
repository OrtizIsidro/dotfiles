local function transparent_bg(group, link)
  local target = link or group
  local hl = vim.api.nvim_get_hl(0, { name = target, link = true })
  hl.bg = "none"
  vim.api.nvim_set_hl(0, group, hl)
end

local groups = {
  "Normal",
  "NormalFloat",
  "NormalNC",
  "SignColumn",
  "SnacksPickerTree",
  "FloatTitle",
}

local groups_with_link = {
  { "SnacksPickerDirectory", "Directory" },
  { "SnacksPickerBorder", "FloatBorder" },
  { "SnacksPickerBoxBorder", "SnacksPickerBorder" },
  { "SnacksPickerTitle", "FloatTitle" },
  { "SnacksPickerBoxTitle", "SnacksPickerTitle" },
  { "SnacksPickerInput", "SnacksPicker" },
  { "SnacksPickerInputBorder", "SnacksPickerBorder" },
  { "SnacksPickerPrompt", "Special" },
}

for _, g in ipairs(groups) do
  transparent_bg(g)
end

for _, g in ipairs(groups_with_link) do
  transparent_bg(g[1], g[2])
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent_bg", { clear = true }),
  callback = function()
    for _, g in ipairs(groups) do
      transparent_bg(g)
    end
    for _, g in ipairs(groups_with_link) do
      transparent_bg(g[1], g[2])
    end
  end,
})

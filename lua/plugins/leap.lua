return {
  "ggandor/leap.nvim",
  enabled = true,
  keys = function()
    return {
      { "f", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap forward to", remap = true },
      { "F", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gf", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from windows", remap = true },
    }
  end,
  config = function(_, opts)
    local leap = require("leap")
    for k, v in pairs(opts) do
      leap.opts[k] = v
    end
    leap.add_default_mappings(false)
    vim.keymap.del({ "x", "o" }, "x")
    vim.keymap.del({ "x", "o" }, "X")
  end,
}

return {
  "theniceboy/joshuto.nvim",
  lazy = true,
  cmd = "Joshuto",
  keys = {
    { "R", "<cmd>Joshuto<cr>", desc = "File Navigator" },
  },
  config = function()
    vim.g.joshuto_floating_window_scaling_factor = 1.0
    vim.g.joshuto_use_neovim_remote = 1
    vim.g.joshuto_floating_window_winblend = 0
  end,
}

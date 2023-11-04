return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "tt", "<cmd>Neotree toggle left dir=./<cr>", desc = "Explorer Neotree (pwd)" },
    { "<leader>e", "<cmd>Neotree toggle float git_status<cr>", desc = "Git Explorer" },
  },
  opts = {
    window = {
      mappings = {
        ["C"] = "close_all_subnodes",
        ["Z"] = "expand_all_nodes",
        ["h"] = "navigate_up",
        ["f"] = "focus_preview",
        ["t"] = "none",
        ["o"] = "open",
        ["O"] = "open_tabnew",
        ["i"] = "open_vsplit",
        ["I"] = "open_split",
        ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
        ["sc"] = { "order_by_created", nowait = false },
        ["sd"] = { "order_by_diagnostics", nowait = false },
        ["sg"] = { "order_by_git_status", nowait = false },
        ["sm"] = { "order_by_modified", nowait = false },
        ["sn"] = { "order_by_name", nowait = false },
        ["ss"] = { "order_by_size", nowait = false },
        ["st"] = { "order_by_type", nowait = false },
        ["Q"] = "close_window",
      },
      fuzzy_finder_mappings = {
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = { "git_add_all", desc = "Git add all" },
          ["gu"] = { "git_unstage_file", desc = "Git unstage file" },
          ["ga"] = { "git_add_file", desc = "Git add file" },
          ["gr"] = { "git_revert_file", desc = "git revert file" },
          ["gc"] = { "git_commit", desc = "git commit" },
          ["gp"] = { "git_push", desc = "git push" },
          ["gg"] = { "git_commit_and_push", desc = "git commit and push" },
          ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
          ["sc"] = { "order_by_created", nowait = false },
          ["sd"] = { "order_by_diagnostics", nowait = false },
          ["sm"] = { "order_by_modified", nowait = false },
          ["sn"] = { "order_by_name", nowait = false },
          ["ss"] = { "order_by_size", nowait = false },
          ["st"] = { "order_by_type", nowait = false },
        },
      },
    },
  },
}

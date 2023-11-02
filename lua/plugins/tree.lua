-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- custom mappings
  vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  vim.keymap.set("n", "h", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "O", api.node.open.tab, opts("Open: New Tab"))
  vim.keymap.set("n", "I", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "i", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "a", api.fs.create, opts("Create File"))
  vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy File"))
  vim.keymap.set("n", "dd", api.fs.cut, opts("Cut File"))
  vim.keymap.set("n", "dD", api.fs.trash, opts("Trash File"))
  vim.keymap.set("n", "DD", api.fs.remove, opts("Remove File"))
  vim.keymap.set("n", "yp", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "cw", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "zh", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
  vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
  vim.keymap.set("n", "zi", api.tree.toggle_gitignore_filter, opts("Toggle Gitignore"))
  vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
  vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
  vim.keymap.set("n", "L", api.tree.expand_all, opts("Expand All"))
  vim.keymap.set("n", "[d", api.node.navigate.diagnostics.next, opts("Diagnostics Next"))
  vim.keymap.set("n", "]d", api.node.navigate.diagnostics.prev, opts("Diagnostics Prev"))
  vim.keymap.set("n", "]d", api.node.navigate.diagnostics.prev, opts("Diagnostics Prev"))
  vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
  vim.keymap.set("n", "n", api.tree.collapse_all, opts("Collapse"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle Help"))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = my_on_attach,
    })
  end,
}

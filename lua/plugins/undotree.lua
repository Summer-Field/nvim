return {
  "mbbill/undotree",
  cmd = "Undotree",
  keys = {
    { "U", "<cmd>UndotreeToggle<cr>", desc = "Undotree", noremap = true },
  },
  config = function()
    vim.g.undotree_DiffAutoOpen = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_DiffpanelHeight = 8
    vim.g.undotree_SplitWidth = 24

    vim.cmd([[
    function g:Undotree_CustomMap()
      nmap <buffer> k <plug>UndotreeNextState
      nmap <buffer> j <plug>UndotreePreviousState
      nmap <buffer> K 5<plug>UndotreeNextState
      nmap <buffer> J 5<plug>UndotreePreviousState
    endfunc
    ]])
  end,
}

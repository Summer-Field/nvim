vim.g.tcomment_textobject_inlinecomment = ""
vim.keymap.set("n", "ci", "cl", { remap = false })

vim.keymap.set("n", "<leader>cn", "<Plug>TComment_Commentc", { desc = "Comment" })
vim.keymap.set("v", "<leader>cn", "<Plug>TComment_Commentb", { desc = "Comment" })
vim.keymap.set("n", "<leader>cu", "<Plug>TComment_Uncommentc", { desc = "Uncomment" })
vim.keymap.set("v", "<leader>cu", "<Plug>TComment_Uncommentb", { desc = "Uncomment" })

return {
  "tomtom/tcomment_vim",
}

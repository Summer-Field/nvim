return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { mode = "i", "<C-k>", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "H", vim.lsp.buf.hover }
    keys[#keys + 1] = { mode = "i", "<c-h>", vim.lsp.buf.signature_help }
    keys[#keys + 1] = { "gD", ":tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>" }
    keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename }
    keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition }
  end,
}

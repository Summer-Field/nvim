-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

-- Mode
local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }

-- Split Command
local split_up = "<cmd>set nosplitbelow<cr>:split<cr>:set splitbelow<cr>"
local split_down = "<cmd>set splitbelow<cr>:split<cr>"
local split_left = "<cmd>set nosplitright<cr>:vsplit<cr>:set splitright<cr>"
local split_right = "<cmd>set splitright<cr>:vsplit<cr>"

-- Simple Command

-- Savw & Quit
vim.keymap.set(mode_n, "Q", "<cmd>q<cr>", { desc = "Quit", noremap = true, silent = true })
vim.keymap.set(mode_n, "S", "<cmd>w<cr>", { desc = "Save", noremap = true, silent = true })

-- Fast Move
vim.keymap.set(mode_nv, "<S-j>", "5j", { desc = "Fast move down", silent = true })
vim.keymap.set(mode_nv, "<S-k>", "5k", { desc = "Fast move up", silent = true })
vim.keymap.set(mode_nv, "<S-w>", "5w", { desc = "Fast move forward", noremap = true, silent = true })
vim.keymap.set(mode_nv, "<S-b>", "5b", { desc = "Fast move back", noremap = true, silent = true })
vim.keymap.set(mode_nv, "<C-j>", "5<C-y>", { desc = "Fast move down", silent = true })
vim.keymap.set(mode_nv, "<C-k>", "5<C-e>", { desc = "Fast move down", silent = true })
vim.keymap.set(mode_nv, "-", "N", { desc = "Tail of line", silent = true })
vim.keymap.set(mode_nv, "=", "n", { desc = "Tail of line", silent = true })
vim.keymap.set(mode_nv, "_", "5N", { desc = "Fast Tail of line", silent = true })
vim.keymap.set(mode_nv, "+", "5n", { desc = "Fast Tail of line", silent = true })
vim.keymap.set(mode_nv, "N", "0", { desc = "Head of line", noremap = true, silent = true })
vim.keymap.set(mode_nv, "M", "$", { desc = "Tail of line", noremap = true, silent = true })

-- Window & Split
vim.keymap.set(mode_nv, "s", "<nop>", { silent = true })
vim.keymap.set(mode_n, "srh", "<C-w>b<C-w>K", { desc = "Rotate window to horizontal" })
vim.keymap.set(mode_n, "srv", "<C-w>b<C-w>H", { desc = "Rotate window to vertical" })
vim.keymap.set(mode_n, "<leader>q", "<C-w>c", { desc = "Close window", remap = true })
vim.keymap.set(mode_n, "<leader>o", "<C-w>o", { desc = "Reopen window", remap = true })
vim.keymap.set(mode_n, "<leader>w", "<C-w>w", { desc = "Next next window", remap = true })
vim.keymap.set(mode_n, "<leader>h", "<C-w>h", { desc = "Move to left window", remap = true })
vim.keymap.set(mode_n, "<leader>l", "<C-w>l", { desc = "Move to rignt window", remap = true })
vim.keymap.set(mode_n, "<leader>j", "<C-w>j", { desc = "Move to below window", remap = true })
vim.keymap.set(mode_n, "<leader>k", "<C-w>k", { desc = "Move to above window", remap = true })
vim.keymap.set(mode_n, "<up>", ":res +5<cr>", { desc = "Resize window up" })
vim.keymap.set(mode_n, "<down>", "<cmd>res -5<cr>", { desc = "Resize window down" })
vim.keymap.set(mode_n, "<left>", "<cmd>vertical resize -5<cr>", { desc = "Resize window left" })
vim.keymap.set(mode_n, "<right>", "<cmd>vertical resize +5<cr>", { desc = "Resize window right" })
vim.keymap.set(mode_n, "sw", split_up, { desc = "Split window up", noremap = true, silent = true })
vim.keymap.set(mode_n, "sx", split_down, { desc = "Split window down", noremap = true, silent = true })
vim.keymap.set(mode_n, "sa", split_left, { desc = "Split window left", noremap = true, silent = true })
vim.keymap.set(mode_n, "sd", split_right, { desc = "Split window right", noremap = true, silent = true })

-- Tab Management
vim.keymap.set(mode_n, "tu", "<cmd>tabe<cr>", { desc = "Create new tabe", noremap = true, silent = true })
vim.keymap.set(mode_n, "tU", "<cmd>tabe<cr>", { desc = "Create new tabe", noremap = true, silent = true })
vim.keymap.set(mode_n, "th", "<cmd>-tabnext<cr>", { desc = "Move to previous tab", noremap = true, silent = true })
vim.keymap.set(mode_n, "tl", "<cmd>+tabnext<cr>", { desc = "Move to next tab", noremap = true, silent = true })
vim.keymap.set(mode_n, "tmh", "<cmd>-tabmove<cr>", { desc = "Move tab left", noremap = true, silent = true })
vim.keymap.set(mode_n, "tml", "<cmd>+tabmove<cr>", { desc = "Move tab right", noremap = true, silent = true })

-- Other
vim.keymap.set(mode_nv, "`", "~", { desc = "Switch case", noremap = true, silent = true })
vim.keymap.set(mode_n, "<leader><cr>", ":nohlsearch<cr>", { desc = "No highlights", noremap = true, silent = true })
vim.keymap.set(mode_n, "<leader>o", "za", { desc = "Fold", noremap = true, silent = true })
vim.keymap.set(mode_n, "\\v", "v%", { desc = "Visual to end", silent = true })
vim.keymap.set(mode_n, "<leader><esc>", "<nop>", { desc = "Visual to end", silent = true })
vim.keymap.set(mode_nv, ";", ":", { noremap = true })
vim.keymap.set(mode_v, "Y", "+y", { desc = "Paste to cliboard", noremap = true, silent = true })

-- Joshuto
vim.keymap.set(mode_n, "R", ":Joshuto<cr>", { desc = "Joshuto", silent = true })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- File Explorer
vim.keymap.set(mode_n, "tt", "<cmd>NvimTreeToggle<cr>", { desc = "Open File Tree" })

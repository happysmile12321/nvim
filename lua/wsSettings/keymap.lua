-- 设置主键
vim.g.mapleader = " "
local keymap = vim.keymap
-- 普通模式
keymap.set("n", "te", ":tabe ")
keymap.set("n", "<S-Tab>", ":tabprev<Return>")
keymap.set("n", "<Tab>", ":tabnext<Return>")
keymap.set("n", "gl", "A<Esc>")
keymap.set("n", "gh", "I<esc>l")
keymap.set("n", "ge", "G")
keymap.set("n", "c", "vdi")
keymap.set("n", "d", "vd")
keymap.set("n", "*", "ggVG")
keymap.set("n", "r", "<cmd>CocCommand flutter.dev.hotRestart<cr>")
-- 命令模式
keymap.set("c", "hs", "split")

-- 终端模式
-- 使用esc退出终端模式
keymap.set("t", "<Esc>", "<C-\\><C-n>")

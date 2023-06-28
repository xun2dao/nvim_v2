vim.g.mapleader = ","

local map = vim.keymap.set

-- 单行或多行
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


-- 分屏 和 切屏
map("n", "sv", "<C-w>v")
map("n", "sh", "<C-w>s")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- 取消高亮
map("n", "<leader>n", ":nohl<CR>")


-- nvim-tree
map("n","<leader>t", ":NvimTreeToggle<CR>")

-- bufferline 
map("n", "<leader>a", ":bp<CR>")
map("n", "<leader>f", ":bn<CR>")


-- follow-md-links.nvim
map("n", "<bs>", ":edit#<cr>")


-- 关于nvim的基本设置

-- 禁止netrw
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true


--  缩进
opt.tabstop = 4 
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false;


-- 光标行
opt.cursorline = true


-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 搜索
opt.ignorecase = true
opt.smartcase = true

 -- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 设置路径：存储nvim-tree sitter 实现高亮的解析器
--opt.runtimepath:append("~/.local/share/nvim/nvim-treesitter")




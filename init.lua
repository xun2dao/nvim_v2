require("core.basic")
require("core.keybinds")

-- plugins

require("plugins.packer")
require("plugins.lualine")

require("plugins.nvim-tree")
require("plugins.nvim-treesitter")


-- LSP
require("plugins.lsp")

-- auto completion 
require("plugins.cmp")

-- comment 
require("plugins.comment")

-- autopairs
require("plugins.autopairs")

-- bufferline
require("plugins.bufferline")
-- gitsigns
require("plugins.gitsigns")

--file search : telescope
require("plugins.telescope")
-- theme
vim.cmd[[colorscheme tokyonight]]



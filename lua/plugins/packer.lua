
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    -- Theme 
    use 'folke/tokyonight.nvim'


    -- statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- nvim-tree 
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }
    -- 语法高亮 
    use {
        'nvim-treesitter/nvim-treesitter',
    } 
    use{
        'HiPhish/nvim-ts-rainbow2', -- 配合nvim-treesitter 实现不同括号具有不同颜色
    }

    -- LSP 
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- auto completion
     use{'neovim/nvim-lspconfig',}
     use{'hrsh7th/cmp-nvim-lsp',}
     use{'hrsh7th/cmp-buffer',}
     use{'hrsh7th/cmp-path',}
     use{'hrsh7th/nvim-cmp',}
     use{'hrsh7th/cmp-cmdline',}
     use {'dcampos/nvim-snippy', }
     use {'dcampos/cmp-snippy',}
    -- comment and autopairs 
   use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- buffer line
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {'lewis6991/gitsigns.nvim'}

    -- telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',requires = { {'nvim-lua/plenary.nvim'} }}

end)

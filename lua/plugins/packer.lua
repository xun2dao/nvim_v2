return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Theme
	use("folke/tokyonight.nvim")

	-- markdown preview
	-- use({
	-- 	"ellisonleao/glow.nvim",
	-- 	config = function()
	-- 		require("glow").setup()
	-- 	end,
	-- })
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	-- nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	-- 语法高亮
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use({
		"HiPhish/nvim-ts-rainbow2", -- 配合nvim-treesitter 实现不同括号具有不同颜色
	})

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- auto completion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "dcampos/nvim-snippy" })
	use({ "dcampos/cmp-snippy" })
	-- comment and autopairs
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- buffer line
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "lewis6991/gitsigns.nvim" })

	-- telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } })

	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		requires = "nvim-tree/nvim-web-devicons",
	})
	-- formatting
	use({ "mhartington/formatter.nvim" })

	-- image preview
	use({
		"samodostal/image.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
	})

	-- markdown plugins
	use({
		"jghauser/follow-md-links.nvim",
	})

	use({
		"ferrine/md-img-paste.vim",
	})

	-- Navigator
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		},
	})
end)

return {
	-- Color Schemes
	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000, },

	-- Status Line
	"nvim-lualine/lualine.nvim",

	-- Git Integrations
	"lewis6991/gitsigns.nvim", -- Highlight changed lines
	"tpope/vim-fugitive", -- Git commands in nvim
	"tpope/vim-rhubarb", -- Fugitive-companion to interact with github
	"sindrets/diffview.nvim", -- Improved diff view and browsing

	-- Telescope: Fuzzy searching and navigation over everything
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "debugloop/telescope-undo.nvim", config = function()
			require("telescope").setup({
					extensions = {
						undo = {
							side_by_side = true,
							layout_strategy = "vertical",
							layout_config = {
								preview_height = 0.8,
							},
						},
					},
				})
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end,
	},

	{
    "folke/which-key.nvim",
    config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		end,
	},
	-- Automatically close brackets, quotes, etc.
	{ "windwp/nvim-autopairs", config = true, },

	-- TreeSitter: Generate and interact with the abstract syntax tree
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for TreeSitter
	"nvim-treesitter/nvim-treesitter-context", -- Keep nested context visible with TreeSitter

	-- LSP: Language Server Protocol
	"neovim/nvim-lspconfig",
	{ "williamboman/mason.nvim", config = true },
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- Formatters
	{"averms/black-nvim", build = ":UpdateRemotePlugins"},
	{ "wesleimp/stylua.nvim", enabled = false }, -- Opinionated Lua formatter, run with :lua require("stylua").format()

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"ray-x/cmp-treesitter",
	"saadparwaiz1/cmp_luasnip",

	-- Symbol and tags management
	{ "ludovicchabant/vim-gutentags", enabled = false }, -- Automatic tags management
	{ "simrat39/symbols-outline.nvim", enabled = false }, -- Symbol based navigation using LSP

	-- Markdown Live Previewer
	{ "iamcco/markdown-preview.nvim", build = function() vim.fn["mkdp#util#install"]() end, ft = { "markdown" } },

	-- HashiCorp Terraform
	{ "hashivim/vim-terraform", ft = "terraform" },

	-- Miscellaneous utilities and libraries
	"nvim-lua/plenary.nvim", -- Helper functions used by numerous plugins
	"kyazdani42/nvim-web-devicons", -- File type icons
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	"romainl/vim-qf", -- Quickfix improvements
	"sheerun/vim-polyglot", -- Improved support for a bunch of extra (and mixed) filetypes
	"tpope/vim-abolish", -- Operate on variants of a word
	"tpope/vim-commentary", -- Toggle comments with gc or Commentary
	"tpope/vim-repeat", -- Better support for the repeat operator
	"tpope/vim-surround", -- Manage surrounding characters (e.g. quotes and brackets)
	"tpope/vim-unimpaired", -- Pairs of handy bracket mappings
	"tpope/vim-vinegar", -- Back up a directory with -

	-- Interesting plugins for consideration
	-- https://github.com/Wansmer/treesj
	{ "Wansmer/treesj", enabled = false },
	-- https://github.com/RRethy/vim-illuminate
	{ "RRethy/vim-illuminate", enabled = false },
}

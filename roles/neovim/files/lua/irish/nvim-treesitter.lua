require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"bash",
		"dockerfile",
		"hcl",
		"html",
		"javascript",
		"latex",
		"lua",
		"make",
		"php",
		"python",
		"rasi",
		"regex",
		"vim",
		"yaml",
	},
	sync_install = false,
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gsi',
			node_incremental = 'gsn',
			scope_incremental = 'gss',
			node_decremental = 'gsd',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
			selection_modes = {
				['@parameter.outer'] = 'v', -- charwise
				['@function.outer'] = 'V', -- linewise
				['@class.outer'] = '<c-v>', -- blockwise
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
				[']r'] = '@parameter.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
				[']R'] = '@parameter.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
				['[r'] = '@parameter.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
				['[R'] = '@parameter.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['>r'] = '@parameter.inner',
			},
			swap_previous = {
				['<r'] = '@parameter.inner',
			},
		},
		lsp_interop = {
			enable = true,
			border = 'none',
			floating_preview_opts = {},
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},

	},
	indent = {
		enable = true,
	},
}

local map = vim.api.nvim_set_keymap

local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close -- ESC closes
			}
		},
		show_line = false,
		prompt_prefix = '> ',
		prompt_title = '',
		results_title = '',
		preview_title = '',
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		sorting_strategy = 'ascending',
		scroll_strategy = 'cycle',
		layout_strategy = 'vertical',
		layout_config = {
			preview_cutoff = 1,
			prompt_position = 'top',
			horizontal = {
				preview_width = 0.6
			},
			width = 0.8,
			height = 0.9
		}
	},
}

telescope.load_extension 'fzf'

-- Telescope keymaps
local default_opts = { noremap = true, silent = true, desc = "Search history" }

-- Typical builtins
map('n', '<leader>s/', ":lua require('telescope.builtin').search_history{}<CR>", default_opts)
map('n', '<leader>s:', ":lua require('telescope.builtin').command_history{}<CR>", default_opts)
map('n', '<leader>sb', ":lua require('telescope.builtin').buffers{}<CR>", default_opts)
map('n', '<leader>sc', ":lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>", default_opts)
map('n', '<leader>sd', ":lua require('telescope.builtin').diagnostics{}<CR>", default_opts)
map('n', '<leader>se', ":lua require('telescope.builtin').treesitter{}<CR>", default_opts)
map('n', '<leader>sf', ":lua require('telescope.builtin').find_files{no_ignore=true}<CR>", default_opts)
map('n', '<leader>sg', ":lua require('telescope.builtin').git_files{}<CR>", default_opts)
map('n', '<leader>sj', ":lua require('telescope.builtin').jumplist{}<CR>", default_opts)
map('n', '<leader>sl', ":lua require('telescope.builtin').loclist{}<CR>", default_opts)
map('n', '<leader>sq', ":lua require('telescope.builtin').quickfix{}<CR>", default_opts)
map('n', '<leader>sr', ":lua require('telescope.builtin').registers{}<CR>", default_opts)
map('n', '<leader>ss', ":lua require('telescope.builtin').spell_suggest{}<CR>", default_opts)
map('n', '<leader>st', ":lua require('telescope.builtin').tags{}<CR>", default_opts)
map('n', '<leader>sv', ":lua require('telescope.builtin').live_grep{}<CR>", default_opts)
map('n', '<leader>sw', ":lua require('telescope.builtin').grep_string{}<CR>", default_opts)

-- Git maps
map('n', '<leader>gb', ":lua require('telescope.builtin').git_branches{}<CR>", default_opts)
map('n', '<leader>gc', ":lua require('telescope.builtin').git_commits{}<CR>", default_opts)
map('n', '<leader>gf', ":lua require('telescope.builtin').git_bcommits{}<CR>", default_opts)
map('n', '<leader>gs', ":lua require('telescope.builtin').git_status{}<CR>", default_opts)
map('n', '<leader>gt', ":lua require('telescope.builtin').git_stash{}<CR>", default_opts)

-- LSP related maps
map('n', '<space>ic', ":lua require('telescope.builtin').lsp_incoming_calls{}<CR>", default_opts)
map('n', '<space>oc', ":lua require('telescope.builtin').lsp_outgoing_calls{}<CR>", default_opts)
map('n', '<space>rf', ":lua require('telescope.builtin').lsp_references{}<CR>", default_opts)
map('n', '<space>bs', ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", default_opts)
map('n', '<space>ws', ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", default_opts)
map('n', '<space>wS', ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", default_opts)

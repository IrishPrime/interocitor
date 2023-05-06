local gitsigns = require 'gitsigns'

gitsigns.setup {
	signcolumn = false,
	numhl = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 100
	}
}

-- vim.cmd [[
-- 	hi GitGutterAdd guibg=none ctermbg=none
-- 	hi GitGutterChange guibg=none ctermbg=none
-- 	hi GitGutterDelete guibg=none ctermbg=none
-- 	hi GitGutterAddLineNr guibg=none ctermbg=none
-- 	hi GitGutterChangeLineNr guibg=none ctermbg=none
-- 	hi GitGutterDeleteLineNr guibg=none ctermbg=none
-- 	hi GitGutterAddLine guibg=none ctermbg=none
-- 	hi GitGutterChangeLine guibg=none ctermbg=none
-- 	hi GitGutterDeleteLine guibg=none ctermbg=none
-- ]]

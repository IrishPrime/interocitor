-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Enable hlsearch while searching, disable otherwise
vim.cmd [[
	augroup incsearch_highlight
		autocmd!
		autocmd CmdlineEnter /,\? set hlsearch
		autocmd CmdlineLeave /,\? set nohlsearch
	augroup END
]]

-- Remember place in buffer
-- cmd [[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

local map = vim.api.nvim_set_keymap
local keymaps = {}
local mapfn = function(fn)
	return [[<cmd>lua require'irish.keymaps'.]] .. fn .. [[()<CR>]]
end

local default_opts = { noremap = true, silent = true }
map('n', '<leader>*', ":let @/='<C-R>=expand(\"<cword>\")<CR>'<CR>:set hls<CR>", default_opts)

keymaps.source_config = function()
	local ft = vim.api.nvim_buf_get_option(0, 'filetype')
	if ft == 'lua' or ft == 'vim' then
		vim.cmd 'source %'
	end
end
map('n', '<leader>l', mapfn 'source_config', {})

keymaps.close_all_floating = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local win_config = vim.api.nvim_win_get_config(win)
		if win_config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end
map('n', '<esc>', mapfn 'close_all_floating', { silent = true })

-- Use the leader key to interact with the unnamed plus register
map('n', '<leader>p', ':set paste<CR>"+]p<Esc>:set nopaste<CR>', default_opts)
map('n', '<leader>P', ':set paste<CR>"+]P<Esc>:set nopaste<CR>', default_opts)
map('n', '<leader>y', '"+y', default_opts)
map('n', '<leader>Y', '"+Y', default_opts)
map('v', '<leader>y', '"+y', default_opts)
map('v', '<leader>Y', '"+Y', default_opts)

return keymaps

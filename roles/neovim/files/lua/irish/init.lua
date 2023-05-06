local modules = vim.fn.globpath('~/.config/nvim/lua/irish', '*.lua', false, true)

-- get all lua configs in current directory
for _, module_path in ipairs(modules) do
	local module = module_path:gsub('.+/', ''):sub(0, -5)

	-- skip 'init.lua'
	if module ~= 'init' then
		require('irish/' .. module)
	end
end

-- General
-- g.mapleader = '\\'
vim.o.mouse = 'a'
-- vim.o.clipboard = 'unnamedplus'
vim.o.guicursor = 'i:block'

-- Behavior
vim.o.autowrite = true

-- Display
vim.o.cursorline = true
vim.o.foldmethod = "indent"
vim.o.laststatus = 2
vim.o.list = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")
vim.opt.fillchars:append("fold:─")
vim.opt.fillchars:append("foldclose:─")
vim.opt.fillchars:append("foldclose:")
vim.opt.wildmode = "longest:full"

-- Grep
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- Whitespace
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.expandtab = false
vim.o.fixendofline = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- Search
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

-- Functions
vim.cmd [[
	function! NeatFoldText()
		let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
		let lines_count = v:foldend - v:foldstart + 1
		let lines_count_text = printf(' %4d lines ', lines_count)
		let foldchar = matchstr(&fillchars, 'fold:\zs.')
		let foldtextstart = strpart('  ' . repeat(foldchar, v:foldlevel * 2) . line, 0, (winwidth(0) * 2) / 3)
		let foldtextend = lines_count_text . repeat(foldchar, 8)
		let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
		return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
	endfunction
	set foldtext=NeatFoldText()
]]

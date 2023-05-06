-- Set the colorscheme
vim.cmd.colorscheme("nord")

-- indent-blankline colors must be set after the colorscheme is loaded
-- because colorschemes tend to clear other highlights before being applied
vim.cmd [[ highlight IndentBlanklineIndent1 guifg=#BF616A gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent2 guifg=#D08770 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent3 guifg=#EBCB8B gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent4 guifg=#A3BE8C gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent5 guifg=#5E81AC gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent6 guifg=#B48EAD gui=nocombine ]]

vim.cmd [[ highlight! link GitSignsCurrentLineBlame TSComment ]]

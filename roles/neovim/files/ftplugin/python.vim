setlocal textwidth=88

setlocal expandtab
setlocal shiftwidth=4
setlocal smarttab
setlocal softtabstop=4
setlocal tabstop=4

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:python_recommended_style = 0

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py call BlackSync()
augroup end

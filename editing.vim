nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//g<Left><Left>

" dd without overwriting register
nmap <Leader>dd "_dd

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default (source: https://vim.fandom.com/wiki/Example_vimrc)
map Y y$
map D d$

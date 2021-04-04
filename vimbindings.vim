highlight EndOfBuffer guifg=bg
let g:termdebug_wide = 1

set wildmenu
set wildcharm=<C-Z>

cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

map <Space> <Leader>

" Inserting lines in normal mode
nmap <CR> o<Esc>

" So can follow links for quickfix
augroup quickfixgroup
	autocmd!
	autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" Faster replaying of macros in register w
nmap <Leader>q @q
vmap <Leader>q :norm @q<CR>
vmap . :norm .<CR>

"Quickly run shell command
map <Leader>s :!

" Fast run commands for current line
nnoremap <leader>cr yy:<C-r>"<CR> " colon command
nnoremap <leader>ce yy:!<C-r>"<CR> " shell command

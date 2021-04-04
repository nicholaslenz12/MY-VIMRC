let g:NERDSpaceDelims = 1

let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1

augroup docgroup
	autocmd!
	autocmd FileType java nmap <Leader>cd :Dox<CR>
	autocmd FileType python nmap <Leader>cd :Docstring<CR>
augroup END

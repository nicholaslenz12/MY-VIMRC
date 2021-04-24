let g:NERDSpaceDelims = 1

let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

augroup docgroup
	autocmd!
	autocmd FileType java nmap <Leader>cc :Dox<CR>
	autocmd FileType python nmap <Leader>cc :Docstring<CR>
augroup END

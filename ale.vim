" CONFIG
let g:ale_fix_on_save = 1

let g:ale_linters = {
	\ 'python' : ['pyls']}

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['yapf', 'black', 'autopep8', 'isort'],
    \ 'c': ['clang-format'],
    \ 'cpp': ['clang-format']}

" MAPPINGS
nmap <Leader>ld :ALEGoToDefinition<CR>
nmap <Leader>lr :ALEFindReferences<CR>
nmap <Leader>ln :ALERename<CR>

nmap <leader>la  :ALECodeAction<CR>

nmap <leader>l] :ALENext<CR>
nmap <leader>l[ :ALEPrevious<CR>

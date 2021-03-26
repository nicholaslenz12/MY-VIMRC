" CONFIG
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['yapf', 'black', 'autopep8', 'isort'],
    \ 'c': ['clang-format'],
    \ 'cpp': ['clang-format']}

" MAPPINGS
nmap <LEADER>cf :ALEFix<CR>

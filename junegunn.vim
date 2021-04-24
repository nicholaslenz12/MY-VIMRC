let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fh :Files ~<CR>
nnoremap <Leader>fg :GFiles --cached --others --exclude-standard<CR>
nnoremap <Leader>fj :GFiles --cached --others *.java<CR>
nnoremap <Leader>rg :Rg<CR>

let g:goyo_width = 120
nnoremap <Leader>gy :Goyo<CR>

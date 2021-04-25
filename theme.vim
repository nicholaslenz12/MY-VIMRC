if !has("gui_running")
    set termguicolors
endif

" colorscheme monokai
colorscheme gruvbox
" colorscheme onedark

" nnoremap <C-[> :CycleColorPrev<CR>
" nnoremap <C-]> :CycleColorNext<CR>

let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1
if has('nvim')
  let g:airline_disable_statusline = 1
endif

" See http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬,trail:·

" Built-in terminal
if has("nvim")
  autocmd TermOpen * setlocal nonumber
else
  autocmd TerminalOpen * setlocal nonumber
endif

" Show relative line numbering
nnoremap <Leader><Tab> :set invrelativenumber<CR>

" Folding text
nnoremap <Leader>f za

" Remove highlight search
nnoremap <Leader>e :nohl<CR><C-L>


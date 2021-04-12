" Create window to the right
map <bar> <C-W>v<C-W><Right>
" Create window to the left
map _ <C-W>s<C-W><Down>

nnoremap <C-N> :bnext<Enter>
nnoremap <C-P> :bprevious<Enter>

nnoremap <Leader>n :tabnext<Enter>
nnoremap <Leader>p :tabprevious<Enter>

nnoremap <Leader>xb :buffers<CR>:buffer<Space>

" Edit vimrc
nnoremap <F5> :e $MYVIMRC<CR>

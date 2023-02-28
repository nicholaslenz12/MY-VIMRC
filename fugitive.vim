" nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gl :Gclog<CR>

" https://gist.github.com/actionshrimp/6493611
function! ToggleGStatus()
    if buflisted(bufname('fugitive:///*/.git//$'))
        execute ":bdelete" bufname('fugitive:///*/.git/') 
    else
        Git
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
nnoremap <C-1> :ToggleGStatus<CR>

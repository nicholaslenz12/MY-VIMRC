" Move to line
map <Leader>k <Plug>(easymotion-bd-jk)

" Move to word
map  <Leader>j <Plug>(easymotion-bd-w)

" Easymotion edits the current buffer to display possible motions--makes 
" linter upset :(
augroup easymotiongroup
  autocmd User EasyMotionPromptBegin silent! CocDisable
  autocmd User EasyMotionPromptEnd   silent! CocEnable
augroup END

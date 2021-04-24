" Source https://www.chrisatmachine.com/Neovim/15-which-key/

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : [':Files', 'fuzzy-search'],
      \ 'h' : [':Files ~', 'fuzzy-home'],
      \ 'g' : [':GFiles', 'fuzzy-git'],
      \ 'j' : [':GFiles', 'fuzzy-java'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+ripgrep' ,
      \ 'g' : [':Rg'     , 'ripgrep'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b' : [':Gbranches', 'fuzzy-branches'],
      \ 'c' : [':Gbranches checkout', 'fuzzy-checkout'],
      \ 'd' : [':Gbranches delete', 'fuzzy-delete'],
      \ 'r' : [':Gbranches rebase', 'fuzzy-rebase'],
      \ 's' : [':G', 'show-stage'],
      \ }

call which_key#register('<Space>', "g:which_key_map")

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

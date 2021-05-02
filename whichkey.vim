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

let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
	  \ 'd' : ['<Plug>(coc-definition)', 'lsp-definition'],
	  \ 'r' : ['<Plug>(coc-references)', 'lsp-references'],
	  \ 'f' : ['<Plug>(coc-refactor)', 'lsp-refactor'],
	  \ 'n' : ['<Plug>(coc-rename)', 'lsp-rename'],
	  \ 'a' : [' <Plug>(coc-codeaction)', 'lsp-codeaction'],
	  \ '[ <' : ['lug>(coc-diagnostic-prev)', 'lsp-diagnostic-prev'],
	  \ '] <' : ['lug>(coc-diagnostic-next)', 'lsp-diagnostic-next'],
	  \ }

let g:which_key_map.t = {
      \ 'name' : '+(la)tex' ,
	  \ 'l' : [':!latexmk -pdf -synctex=1 %', 'latex-latexmk'],
	  \ 'x' : [':!xelatex -pdf -synctex=1 %', 'latex-xelatex'],
	  \ 'c' : [':!latexmk -c', 'latex-clean'],
	  \ 's' : [':!open -a Skim %:r.pdf', 'latex-open'],
	  \ }

call which_key#register('<Space>', "g:which_key_map")

" Hide status line
augroup whichkey
  autocmd!
  autocmd! FileType which_key
  autocmd  FileType which_key set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
augroup END

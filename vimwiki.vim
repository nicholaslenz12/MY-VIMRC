let wiki = {}
let wiki.nested_syntaxes = {'python': 'python',
			\ 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

nnoremap <Leader>cb :VimwikiToggleListItem<CR>

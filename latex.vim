autocmd FileType tex nmap <buffer> <Leader>tl :!latexmk -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>tx :!xelatex -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>tc :!latexmk -c <CR>
autocmd FileType tex nmap <buffer> <Leader>ts :!open -a Skim '%:r.pdf' <CR>

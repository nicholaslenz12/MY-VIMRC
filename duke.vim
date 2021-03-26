map <C-K> :py3f /usr/local/Cellar/clang-format/*/share/clang/clang-format.py<CR>

"  Open netrw for Duke VM
nnoremap <F6> :e scp://nwl4@vcm-5185.vm.duke.edu/<CR>

" Compiling
autocmd FileType c nnoremap <buffer> <F8> :!/usr/bin/gcc -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu99 -ggdb3 %<CR>
autocmd FileType cpp nnoremap <buffer> <F8> :!/usr/bin/g++ -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu++11 -ggdb3 %<CR>
nnoremap <F20> :!./'%:r'<CR>

" Skeleton
autocmd BufNewFile */src/test/*.java :call JavaSkeleton('skeleton_junit')
autocmd BufNewFile */src/main/*.java :call JavaSkeleton('skeleton_java')
function! JavaSkeleton(filename)
  execute ':r ~/vim/' . a:filename
  :.,$s/____/\=expand('%:t:r')/g
endfunction

" Coverage
function! TellCoverage()
  :!~/Desktop/ece651-spr21-nwl4-hwk1/coverage_summary.sh
  :!cat ~/Desktop/ece651-spr21-nwl4-hwk1/coverage.txt
endfunction
nmap <Leader>ct :call TellCoverage()<CR>

nmap <Leader>hh i System.out.println("Here");

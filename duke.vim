" map <C-K> :py3f /usr/local/Cellar/clang-format/*/share/clang/clang-format.py<CR>
map <C-K> :ClangFormat<CR>

"  Open netrw for Duke VM
nnoremap <F6> :e scp://nwl4@vcm-5185.vm.duke.edu/<CR>

" Compiling
augroup cgroup
  autocmd!
  autocmd FileType c nnoremap <buffer> <F8> :!/usr/bin/gcc -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu99 -ggdb3 %<CR>
  autocmd FileType cpp nnoremap <buffer> <F8> :!/usr/bin/g++ -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu++03 -ggdb3 %<CR>
augroup END
nnoremap <F20> :!./'%:r'<CR>

" Skeleton
augroup javagroup
  autocmd!
  autocmd BufNewFile */src/test/*.java :call JavaSkeleton('skeleton_junit')
  autocmd BufNewFile */src/main/*.java :call JavaSkeleton('skeleton_java')
augroup END

function! JavaSkeleton(filename)
  execute ':r ~/vim/' . a:filename
  :.,$s/____/\=expand('%:t:r')/g
endfunction

" Coverage
function! TellCoverage()
  " let coverage_path = system('git rev-parse --show-toplevel')
  " execute printf("!%/coverage_summary.sh", coverage_path)
  :!~/Desktop/risk-ece-651/coverage_summary.sh
  :!cat ~/Desktop/risk-ece-651/coverage.txt
endfunction
nmap <Leader>ct :call TellCoverage()<CR>

nmap <Leader>hh i System.out.println("Here");

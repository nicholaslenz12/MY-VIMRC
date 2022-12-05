" Find files using Telescope command-line sugar.

" "f" is for Find
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
" "rg" is for RipGrep
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
" "b" is for Buffers
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
" "?" is for ?
nnoremap <leader>? <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>p <cmd>lua require('telescope.builtin').commands()<cr>

" "gs" is for Git Status
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
" "gt" is for Git sTash
nnoremap <leader>gt <cmd>lua require('telescope.builtin').git_stash()<cr>
" "gb" is for Git Branch
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
" "gc" is for Git Commits
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>

" "ts" is for TreeSitter
nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<cr>

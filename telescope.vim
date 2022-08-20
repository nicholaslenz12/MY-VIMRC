" Find files using Telescope command-line sugar.

nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ht <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader><space> <cmd>lua require('telescope.builtin').commands()<cr>

nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gh <cmd>lua require('telescope.builtin').git_stash()<cr>

nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<cr>

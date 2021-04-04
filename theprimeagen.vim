vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nmap <Leader>gh :diffget //2<CR>
nmap <Leader>gl :diffget //3<CR>

nnoremap <silent> <leader>pv :NERDTreeFind<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

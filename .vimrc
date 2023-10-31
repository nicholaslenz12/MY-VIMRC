" ---- BASICS ----
set nocompatible                     " don't try to be like vi
syntax on                            " syntax highlighting
filetype indent plugin on
set termguicolors

set ignorecase                       " ignorecase during searches
set smartcase                        " override ignorecase if capitals in search

set lazyredraw                       " don't redraw during macros, ...
set hidden                           " sanity with buffers

" backwards compatibility with vim --->
set backspace=indent,eol,start       " so can use backspace
set hlsearch                         " incremental highlighting for searches
set wildmenu
set wildcharm=<C-Z>
" <---

set shiftwidth=4                     " << and >> command # of columns shifted
set tabstop=4                        " what a tab looks like
set expandtab                        " use spaces to insert tab

set smartindent                      " smartly indent with brackets, etc
set autoindent                       " use indentation of previous line

set showcmd                          " show partially complete commands
set laststatus=2                     " always draw statusline for last window

set confirm                          " confirm choices
set visualbell                       " turn off sounds use visualbell
set t_vb=

set cmdheight=2                      " size 2 avoids some press-enter prompts

set clipboard^=unnamed,unnamedplus   " system clipboard

set number                           " line numebers
set numberwidth=5                    " number column spacing
set colorcolumn=80                   " width before drawing colorcolumn
set noswapfile                       " disable creating swap files
set updatetime=100
set timeoutlen=1000
set cursorline                       " can be slow
set nowrap                           " preference
set mouse=a

" See http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬,trail:·


" ---- NATIVE MAPPINGS ----
nnoremap <F5> :e $MYVIMRC<CR>
map <Space> <Leader>

" windows
map <bar> <C-W>v<C-W><Right>
map _ <C-W>s<C-W><Down>

" navigation in wildmenu
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" adding newlines
nmap <CR> o<Esc>

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" replaying macros
nmap <Leader>q @q
vmap <Leader>q :norm @q<CR>
vmap . :norm .<CR>

" shell
map <Leader>s :!
map <Leader>d :bd<CR>

" replace
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//g<Left><Left>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default (source: https://vim.fandom.com/wiki/Example_vimrc)
map Y y$
map D d$

nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

nnoremap <C-.> <C-w>w
nnoremap <C-,> <C-w>W

nnoremap <Leader>c :noh<CR>

" ---- PLUGINS ----
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.x'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', {'tag': '*'}

Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'numToStr/Comment.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'tversteeg/registers.nvim', {'branch': 'main'}

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'j-hui/fidget.nvim', {'tag' : 'legacy'}

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'rbong/vim-flog'
call plug#end()

colorscheme gruvbox

source ~/.vim/MY-VIMRC/telescope.vim
source ~/.vim/MY-VIMRC/treesitter.vim
source ~/.vim/MY-VIMRC/lualine.vim
source ~/.vim/MY-VIMRC/gitsigns.vim
source ~/.vim/MY-VIMRC/nvim-tree.vim
source ~/.vim/MY-VIMRC/comment.vim
source ~/.vim/MY-VIMRC/toggleterm.vim
source ~/.vim/MY-VIMRC/bufferline.vim
source ~/.vim/MY-VIMRC/fugitive.vim
source ~/.vim/MY-VIMRC/nvim-cmp.vim

source ~/.vim/MY-VIMRC/lsp.lua

" source vimrc on save
augroup vimrcgroup
  autocmd!
  autocmd! bufwritepost ~/.vimrc source %
augroup END

" follow quickfix
augroup quickfixgroup
	autocmd!
	autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" quickfix
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <C-q> :call ToggleQuickFix()<CR>

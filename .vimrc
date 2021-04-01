" =============================================================================
" >>>> BASICS
" =============================================================================
set nocompatible
syntax on
filetype indent plugin on

set lazyredraw
set hidden
set backspace=indent,eol,start

" -----------------------------------------------------------------------------
" >>>> SEARCHING
" -----------------------------------------------------------------------------
set hlsearch
set ignorecase
set smartcase

" -----------------------------------------------------------------------------
" >>>> INDENTATION
" -----------------------------------------------------------------------------
set shiftwidth=2 " << and >> command # of columns shifted
set tabstop=2
set smartindent
set autoindent

" -----------------------------------------------------------------------------
" >>>> INTERACTION
" -----------------------------------------------------------------------------
set showcmd
set laststatus=2

set confirm
set visualbell
set t_vb=

set mouse=a
set cmdheight=2

set clipboard+=unnamed

" -----------------------------------------------------------------------------
" >>>> CODE NAVIGATION
" -----------------------------------------------------------------------------
set number
set numberwidth=5
set colorcolumn=80
set cursorline

" =============================================================================
" >>>> PACKAGES
" =============================================================================
" Built-in
packadd! termdebug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale', { 'on': [] }
Plug 'vimwiki/vimwiki' "
Plug 'airblade/vim-gitgutter' "
Plug 'vim-airline/vim-airline' "
Plug 'vim-airline/vim-airline-themes' "
Plug 'jpalardy/vim-slime'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ECE 651
Plug 'preservim/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'

" https://github.com/liuchengxu/vim-which-key for lazy load
Plug 'liuchengxu/vim-which-key'

" Languages
Plug 'sheerun/vim-polyglot'

" Python
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'pixelneo/vim-python-docstring'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
else
  Plug 'Shougo/deoplete.nvim', { 'on': [] }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'luochen1990/rainbow'
call plug#end()

source ~/.vim/MY-VIMRC/chrisatmachine.vim
source ~/.vim/MY-VIMRC/coc.vim
source ~/.vim/MY-VIMRC/datascience.vim
source ~/.vim/MY-VIMRC/deoplete.vim
source ~/.vim/MY-VIMRC/duke.vim
source ~/.vim/MY-VIMRC/editing.vim
source ~/.vim/MY-VIMRC/fzf.vim
source ~/.vim/MY-VIMRC/latex.vim
source ~/.vim/MY-VIMRC/misc.vim
source ~/.vim/MY-VIMRC/navigation.vim
source ~/.vim/MY-VIMRC/commenting.vim
source ~/.vim/MY-VIMRC/netrw.vim
source ~/.vim/MY-VIMRC/powervim.vim
source ~/.vim/MY-VIMRC/theme.vim
source ~/.vim/MY-VIMRC/theprimeagen.vim
source ~/.vim/MY-VIMRC/tpope.vim
source ~/.vim/MY-VIMRC/supertab.vim
source ~/.vim/MY-VIMRC/vimbindings.vim
source ~/.vim/MY-VIMRC/vimspector.vim
source ~/.vim/MY-VIMRC/vimwiki.vim


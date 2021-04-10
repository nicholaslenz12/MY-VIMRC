" =============================================================================
									 " BASICS
" =============================================================================
set nocompatible
syntax on " synax highlighting
filetype indent plugin on

set lazyredraw " don't redraw during macros, ...
set hidden " hide buffers, avoids extra prompts
set backspace=indent,eol,start " actually can use backspace to delete text

" -----------------------------------------------------------------------------
								   " SEARCHING
" -----------------------------------------------------------------------------
set hlsearch " incremental highlighting for searches
set ignorecase " ignorecase during searches
set smartcase " override ignorecase if capitals in search

" -----------------------------------------------------------------------------
								  " INDENTATION
" -----------------------------------------------------------------------------
set shiftwidth=2 " << and >> command # of columns shifted
set tabstop=4 " what a tab looks like
set smartindent " smartly indent with brackets, etc
set autoindent " use indentation of previous line

" -----------------------------------------------------------------------------
								  " INTERACTION
" -----------------------------------------------------------------------------
set showcmd " show partially complete commands
set laststatus=2 " always draw statusline for last window

set confirm " confirm choices
set visualbell " turn off sounds use visualbell
set t_vb=

set mouse=a " enable mouse
set cmdheight=2 " lines for command line, size 2 avoids some press-enter prompts

set clipboard+=unnamed " clipboard

" -----------------------------------------------------------------------------
								" CODE NAVIGATION
" -----------------------------------------------------------------------------
set number " shows line numbers
set numberwidth=5 " width for number column
set colorcolumn=80 " width before drawing colorcolumn
set cursorline " different background for current line of cursor


" =============================================================================
									" VIM-PLUG
" =============================================================================
							   " ---- BUILT-IN ----
packadd! termdebug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
							  " ---- ESSENTIAL ----
Plug 'puremourning/vimspector'

							 " ---- EASE OF USE ----
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-projectionist'

							  " ---- COMMENTING ----
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'pixelneo/vim-python-docstring'

					" ---- COMPLETITION/LSP/HIGHLIGHTING ----
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
else
  Plug 'Shougo/deoplete.nvim', { 'on': [] }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'sheerun/vim-polyglot'

							  " ---- AESTHETICS ----
Plug 'crusoexia/vim-monokai'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'https://github.com/pineapplegiant/spaceduck'
Plug 'vim-scripts/CycleColor'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

								 " ---- GIT ----
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

								 " ---- FUN ----
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/liuchengxu/vim-which-key'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

								 " ---- TMUX ----
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

" =============================================================================
								  " Souce Files
" =============================================================================
source ~/.vim/MY-VIMRC/chrisatmachine.vim
source ~/.vim/MY-VIMRC/coc.vim
source ~/.vim/MY-VIMRC/datascience.vim
source ~/.vim/MY-VIMRC/deoplete.vim
source ~/.vim/MY-VIMRC/duke.vim
source ~/.vim/MY-VIMRC/editing.vim
source ~/.vim/MY-VIMRC/junegunn.vim
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

augroup vimrcgroup
	autocmd!
	autocmd! bufwritepost ~/.vimrc source %
augroup END

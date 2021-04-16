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
" set cursorline " different background for current line of cursor


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
Plug 'https://github.com/puremourning/vimspector'

							 " ---- EASE OF USE ----
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/tpope/vim-projectionist'

							  " ---- COMMENTING ----
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'https://github.com/pixelneo/vim-python-docstring'

					" ---- COMPLETITION/LSP/HIGHLIGHTING ----
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
if has('nvim')
  Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
else
  Plug 'https://github.com/Shougo/deoplete.nvim', { 'on': [] }
  Plug 'https://github.com/roxma/nvim-yarp'
  Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif
" Plug 'sheerun/vim-polyglot'

							  " ---- AESTHETICS ----
Plug 'https://github.com/crusoexia/vim-monokai'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/pineapplegiant/spaceduck'
Plug 'https://github.com/vim-scripts/CycleColor'
Plug 'https://github.com/sonph/onehalf', { 'rtp': 'vim' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

								 " ---- GIT ----
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/tpope/vim-fugitive'

								 " ---- FUN ----
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/liuchengxu/vim-which-key'

							 " ---- DATA/ML ----
Plug 'https://github.com/jpalardy/vim-slime'
Plug 'https://github.com/hanschen/vim-ipython-cell', { 'for': 'python' }

Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/rhysd/vim-clang-format'
Plug 'https://github.com/mcchrish/nnn.vim'
call plug#end()

" =============================================================================
								  " Souce Files
" =============================================================================
source ~/.vim/MY-VIMRC/chrisatmachine.vim
source ~/.vim/MY-VIMRC/coc.vim
source ~/.vim/MY-VIMRC/datascience.vim
source ~/.vim/MY-VIMRC/deoplete.vim
source ~/.vim/MY-VIMRC/distrotube.vim
source ~/.vim/MY-VIMRC/duke.vim
source ~/.vim/MY-VIMRC/easymotion.vim
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
source ~/.vim/MY-VIMRC/movement.vim

augroup vimrcgroup
	autocmd!
	autocmd! bufwritepost ~/.vimrc source %
	autocmd! bufwritepost ~/.vim/MY-VIMRC/.vimrc source %
augroup END

nmap <silent> gx :!open <cWORD><cr>

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd   silent! CocEnable

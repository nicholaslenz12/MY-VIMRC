" =============================================================================
" >>>> BASICS
" =============================================================================
set nocompatible
syntax on
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete " Completion

set lazyredraw
set hidden
set backspace=indent,eol,start

" =============================================================================
" >>>> PACKAGES
" =============================================================================
" Built-in
packadd! termdebug

" Downloads vim-plug (if DNE) and installs plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'crusoexia/vim-monokai'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf' "
Plug 'dense-analysis/ale', { 'on': [] }
Plug 'vimwiki/vimwiki' "
Plug 'airblade/vim-gitgutter' "
Plug 'vim-airline/vim-airline' "
Plug 'vim-airline/vim-airline-themes' "
Plug 'jpalardy/vim-slime'

Plug 'majutsushi/tagbar'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ECE 651
Plug 'preservim/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'ervandew/supertab'

" https://github.com/liuchengxu/vim-which-key for lazy load
Plug 'liuchengxu/vim-which-key'

" Languages
Plug 'sheerun/vim-polyglot'

" Python
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
else
  Plug 'Shougo/deoplete.nvim', { 'on': [] }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" =============================================================================
" >>>> COLOR THEME
" =============================================================================
if !has("gui_running")
    set termguicolors
endif
colorscheme monokai

" -----------------------------------------------------------------------------
" >>>> MARGIN TWEAKS
" -----------------------------------------------------------------------------
hi clear LineNr
hi LineNr guifg=#95918E
set guioptions=

" =============================================================================
" >>>> WILDMENU
" =============================================================================
" Hitting Tab opens the wildmenu with recommended options
" <TAB>/CTRL-N cycle down through options
" <S-TAB>/CTRL-P cycle down through options
set wildmenu
highlight EndOfBuffer guifg=bg

" So that wildmenu navigation is slightly more intuitive to me
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" =============================================================================
" >>>> SEARCHING
" =============================================================================
" When there is a previous search pattern, highlight all its matches.
set hlsearch
set ignorecase
set smartcase

" =============================================================================
" >>>> INDENTATION
" =============================================================================
set shiftwidth=2 " << and >> command # of columns shifted
set tabstop=2

" =============================================================================
" >>>> INTERACTION
" =============================================================================
set showcmd
set laststatus=2

" Confirms if you want to q or e modified file
set confirm

" Don't beep, just show a bell when doing something wrong
set visualbell
set t_vb=

" Mouse support in all modes
set mouse=a

" Screen lines to use for command-line
set cmdheight=2

" Timeut of 201 ms.
" set notimeout ttimeout ttimeoutlen=201

" Interact with system clipboard
set clipboard+=unnamed
" set clipboard+=unnamedplus

" =============================================================================
" >>>> CODE NAVIGATION
" =============================================================================
" set ruler

" Line numbers, minimum width, and color coloumn
set number
set numberwidth=5
set colorcolumn=80
set cursorline

" =============================================================================
" >>>> KEYBINDINGS
" =============================================================================
" Switch up the leader key
map <Space> <Leader>

" Inserting lines in normal mode
nmap <CR> o<Esc>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Faster replaying of macros in register w
nmap <Leader>q @q
vmap <Leader>q :norm @q<CR>
vmap . :norm .<CR>

"Quickly save buffer
map <Leader>s :!

" So I can escape term-mode, gdb
let g:termdebug_wide = 1

" Fast run commands for current line
nnoremap <leader>cr yy:<C-r>"<CR> " colon command
nnoremap <leader>ce yy:!<C-r>"<CR> " shell command

" -----------------------------------------------------------------------------
" >>>> WINDOW MANAGEMENT
" -----------------------------------------------------------------------------
" Cycle through open windows
map <Tab> <C-W>w

" Create window to the right
map <bar> <C-W>v<C-W><Right>

" Create window to the left
map _ <C-W>s<C-W><Down>

" -----------------------------------------------------------------------------
" >>>> SEARCHING
" -----------------------------------------------------------------------------
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <Leader>e :nohl<CR><C-L>

" Quick find and replace
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//g<Left><Left>

" Show relative line numbering
nnoremap <Leader><Tab> :set invrelativenumber<CR>

nnoremap <C-N> :bnext<Enter>
nnoremap <C-P> :bprevious<Enter>

nnoremap <Leader>n :tabnext<Enter>
nnoremap <Leader>p :tabprevious<Enter>

" -----------------------------------------------------------------------------
" >>>> EDITING
" -----------------------------------------------------------------------------
" Folding text
nnoremap <Leader>f za

" dd without overwriting register
nmap <Leader>dd "_dd

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default (source: https://vim.fandom.com/wiki/Example_vimrc)
map Y y$
map D d$

" See http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬,trail:·

" -----------------------------------------------------------------------------
" >>>> F-Keys
" -----------------------------------------------------------------------------
" Quick buffer changing
nnoremap <F2> :buffers<CR>:buffer<Space>

" netrw
map <F3> :Vexplore<CR>

" Quick run python script
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Edit vimrc
nnoremap <F5> :e $MYVIMRC<CR>

" =============================================================================
" >>>> PYTHON
" =============================================================================
autocmd FileType python map <buffer> <F9> :exec '!clear;python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:exec '!clear;python' shellescape(@%, 1)<CR>

" =============================================================================
" >>>> C FILES
" =============================================================================
map <C-K> :py3f /usr/local/Cellar/clang-format/*/share/clang/clang-format.py<CR>

" =============================================================================
" NETRW
" =============================================================================
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 1

" =============================================================================
" >>>> LATEX
" =============================================================================
autocmd FileType tex nmap <buffer> <Leader>tl :!latexmk -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>tx :!xelatex -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>tc :!latexmk -c <CR>
autocmd FileType tex nmap <buffer> <Leader>ts :!open -a Skim '%:r.pdf' <CR>

" =============================================================================
" >>>> DUKE ECE
" =============================================================================
"  Open netrw for Duke VM
nnoremap <F6> :e scp://nwl4@vcm-5185.vm.duke.edu/<CR>

" Compiling
autocmd FileType c nnoremap <buffer> <F8> :!/usr/bin/gcc -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu99 -ggdb3 %<CR>
autocmd FileType cpp nnoremap <buffer> <F8> :!/usr/bin/g++ -o '%:r'
    \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
    \ -pedantic -std=gnu++98 -ggdb3 %<CR>
nnoremap <F20> :!./'%:r'<CR>

" =============================================================================
" >>>> PLUGINS
" =============================================================================
" -----------------------------------------------------------------------------
" >>>> DEOPLETE
" -----------------------------------------------------------------------------
" CONFIG
let g:deoplete#enable_at_startup = 1

" -----------------------------------------------------------------------------
" >>>> NERDCOMMENTER
" -----------------------------------------------------------------------------
" CONFIG
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation. Add comment symbol to all lines.
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1


" -----------------------------------------------------------------------------
" >>>> VIM SLIME / VIM IPYTHON CELL
" -----------------------------------------------------------------------------
" CONFIG
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_default_config = {
    \ "socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1

" MAPPINGS
nnoremap <Leader>i :IPythonCellExecuteCellJump<CR>

" -----------------------------------------------------------------------------
" >>>> ALE
" -----------------------------------------------------------------------------
" " CONFIG
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
"     \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"     \ 'python': ['yapf', 'black', 'autopep8', 'isort'],
"     \ 'c': ['clang-format'],
"     \ 'cpp': ['clang-format']}
" 
" let g:ale_java_eclipselsp_path = '/home/nicholas/eclipse.jdt.ls'
" 
" " MAPPINGS
" nmap <LEADER>cf :ALEFix<CR>

" -----------------------------------------------------------------------------
" >>>> FZF
" -----------------------------------------------------------------------------
" MAPPINGS
nnoremap <Leader>ff :FZF<CR>

let wiki = {}
let wiki.nested_syntaxes = {'python': 'python',
			\ 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

if has("nvim")
  autocmd TermOpen * setlocal nonumber
else
  autocmd TerminalOpen * setlocal nonumber
endif

" -----------------------------------------------------------------------------
" >>>> COC
" -----------------------------------------------------------------------------
nmap <Leader>ld <Plug>(coc-definition)
nmap <Leader>lr <Plug>(coc-references)
nmap <Leader>ln <Plug>(coc-rename)

xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction)

" -----------------------------------------------------------------------------
" >>>> Projectionist
" -----------------------------------------------------------------------------
nnoremap <Leader>gt :A<CR>

" Skeleton
autocmd BufNewFile */src/test/*.java :call JavaSkeleton('skeleton_junit')
autocmd BufNewFile */src/main/*.java :call JavaSkeleton('skeleton_java')

function! JavaSkeleton(filename)
  execute ':r ~/vim/' . a:filename
  :.,$s/____/\=expand('%:t:r')/g
endfunction

function! TellCoverage()
  " :!~/Desktop/ece651-spr21-nwl4-hwk1/coverage_summary.sh > /dev/null 2>&1
  :!~/Desktop/ece651-spr21-nwl4-hwk1/coverage_summary.sh
  :!cat ~/Desktop/ece651-spr21-nwl4-hwk1/coverage.txt
endfunction

nmap <Leader>ct :call TellCoverage()<CR>
nmap <Leader>cd :Dox<CR>

let g:SuperTabDefaultCompletionType = "<c-n>"

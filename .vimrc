" =============================================================================
" >>>> BASICS
" =============================================================================
set nocompatible
syntax on
filetype indent plugin on

set lazyredraw
set hidden
set backspace=indent,eol,start

" =============================================================================
" >>>> LOAD PACKAGES IN OPT DIRECTORY
" =============================================================================
" Built-in
packadd! termdebug

" Sanity
packadd! vim-monokai
packadd! nerdcommenter
packadd! ultisnips

" Nice
packadd! ale
packadd! vimwiki
packadd! vim-gitgutter
packadd! vim-airline
packadd! vim-airline-themes
packadd! vim-slime
packadd! vim-ipython-cell

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
set notimeout ttimeout ttimeoutlen=201

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
vmap <C-C> "+y

" Switch up the leader key
map <Space> <Leader>

" Inserting lines in normal mode
nmap <CR> o<Esc>

" Faster replaying of macros in register w
nmap <Leader>q @q
vmap <Leader>q :norm @q<CR>
vmap . :norm .<CR>

"Quickly save buffer
map <Leader>s :!

" So I can escape term-mode, gdb
let g:termdebug_wide = 1

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
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Show relative line numbering
nnoremap <Leader><Tab> :set invrelativenumber<CR>

nnoremap <Leader>n :bn<Enter>
nnoremap <Leader>p :bp<Enter>

" -----------------------------------------------------------------------------
" >>>> EDITING
" -----------------------------------------------------------------------------
" Folding text
nnoremap <Leader>f za

" -----------------------------------------------------------------------------
" >>>> F-Keys
" -----------------------------------------------------------------------------
" Quick buffer changing
nnoremap <F2> :buffers<CR>:buffer<Space>

" netrw
map <F3> :Vexplore<CR>

" notes
map <F4> :e ~/.vim/notes.txt<CR>

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
autocmd FileType tex nmap <buffer> <Leader>lm :!latexmk -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>lx :!xelatex -pdf -synctex=1 %<CR>
autocmd FileType tex nmap <buffer> <Leader>lc :!latexmk -c <CR>
autocmd FileType tex nmap <buffer> <Leader>ls :!open -a Skim '%:r.pdf' <CR>

" function CompileOnSave()
"   :!latexmk -pdf %
" endfunction
" autocmd BufWritePost *.tex call CompileOnSave()

" =============================================================================
" >>>> DUKE ECE 
" =============================================================================
"  Open netrw for Duke VM
nnoremap <F6> :e scp://nwl4@vcm-181.vm.duke.edu/ece551/<CR>

" Compiling
autocmd FileType c nnoremap <buffer> <F8> :!/usr/bin/gcc -o '%:r'
      \ -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
      \ -pedantic -std=gnu99 -ggdb3 %<CR>
autocmd FileType cpp nnoremap <buffer> <F8> :!/usr/bin/g++ -o '%:r'
      \	-Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror
      \ -pedantic -std=gnu++98 -ggdb3 %<CR>
nnoremap <F20> :!./'%:r'<CR>

" =============================================================================
" >>>> PLUGINS 
" =============================================================================
" -----------------------------------------------------------------------------
" >>>> DEOPLETE (COMPLETION)
" -----------------------------------------------------------------------------
" CONFIG
let g:deoplete#enable_at_startup = 1

" -----------------------------------------------------------------------------
" >>>> ULTISNIPS (SNIPPETS)
" -----------------------------------------------------------------------------
" MAPPINGS
let g:UltiSnipsExpandTrigger="<C-x>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" -----------------------------------------------------------------------------
" >>>> NERDCOMMENTER (COMMENTING)
" -----------------------------------------------------------------------------
" CONFIG
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

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
" CONFIG
let g:ale_fix_on_save = 1
let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers = {'python': ['yapf', 'black', 'autopep8', 'isort'],
			\ 'c': ['clang-format'], 
			\ 'cpp': ['clang-format']}

" MAPPINGS
nmap <LEADER>cf :ALEFix<CR>

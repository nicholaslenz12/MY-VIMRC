" =============================================================================
" >>>> BASICS
" =============================================================================
set nocompatible
syntax on
filetype indent plugin on
packadd termdebug


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
" >>>> SANITY/PERFORMANCE 
" =============================================================================
" When this option is set, the screen will not be redrawn while
" executing macros, registers and other commands that have not been
" typed. Also, updating the window title is postponed.
set lazyredraw

" So you can use :e ... to open a new file and you won't be required to save
" the file before switching buffers.
set hidden

" set path+=**

" -----------------------------------------------------------------------------
" >>>> WILDMENU
" -----------------------------------------------------------------------------
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

" pattern	'ignorecase'  'smartcase'	matches ~
" foo	          off		-		foo
" foo   	  on		-		foo Foo FOO
" Foo   	  on		off		foo Foo FOO
" Foo   	  on		on		    Foo
" \cfoo	          -		-		foo Foo FOO
" foo\C	          -		-		foo
set ignorecase
set smartcase


" =============================================================================
" >>>> INDENTATION 
" =============================================================================
" set backspace=indent,eol,start
" set autoindent
" set nostartofline
" << and >> command # of columns shifted
set shiftwidth=2
" How :
" How many columns a tab counts for
set tabstop=2

" set expandtab
" set softtabstop=2


" =============================================================================
" >>>> INTERACTION 
" =============================================================================
set showcmd

" The value of this option influences when the last window will have a
" status line:
" 0: never
" 1: only if there are at least two windows
" 2: always
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
" Show the line and column number of the cursor position, separated by a
" comma.  When there is room, the relative position of the displayed
" text in the file is shown on the far right:
" set ruler

" Line numbers, minimum width, and color coloumn
set number
set numberwidth=5
set colorcolumn=80
" set cursorline


" =============================================================================
" >>>> KEYBINDINGS 
" =============================================================================
" Switch up the leader key
map <Space> <Leader>

" Inserting lines in normal mode
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" Faster replaying of macros in register w
nmap <Leader>q @q

"Quickly save buffer
" map <Leader>s :w<CR>
map <Leader>s :!

" So I can escape term-mode, gdb
noremap <Esc> <C-\><C-n>
let g:termdebug_wide = 1

" -----------------------------------------------------------------------------
" >>>> WINDOW MANAGEMENT
" -----------------------------------------------------------------------------
" Cycle through open windows
map <Tab> <C-W>w
" Create window to the right
" map <Bar> <C-W>v<C-W><Right>

" Create window to the left
" map _ <C-W>s<C-W><Down>

" -----------------------------------------------------------------------------
" >>>> SEARCHING
" -----------------------------------------------------------------------------
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <Leader>e :nohl<CR><C-L>

" Quick find and replace
" nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Show relative line numbering
nnoremap <Leader><Tab> :set invrelativenumber<CR>

" Delete current word, enter insert mode
" nnoremap <Leader>c ciw

" Delete current word
" nnoremap <Leader>d diw

" Select current word
" nnoremap <Leader>v viw

" Search using current word
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

nnoremap <Leader>n :bp<Enter>
nnoremap <Leader>p :bn<Enter>

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
" Status Line
" =============================================================================

" Statusline colors
hi Base guibg=#2D2E27 guifg=#ffffff
hi Mode guibg=#ae81ff guifg=#181824 gui=bold
hi Filetype guibg=#2D2E27 guifg=#929dcb
hi LineCol guibg=#ae81ff guifg=#181824 gui=bold

" Get current mode
let g:currentmode={
      \'n' : 'Normal ',
      \'no' : 'N·Operator Pending ',
      \'v' : 'Visual ',
      \'V' : 'V·Line ',
      \'^V' : 'V·Block ',
      \'s' : 'Select ',
      \'S': 'S·Line ',
      \'^S' : 'S·Block ',
      \'i' : 'Insert ',
      \'R' : 'Replace ',
      \'Rv' : 'V·Replace ',
      \'c' : 'Command ',
      \'cv' : 'Vim Ex ',
      \'ce' : 'Ex ',
      \'r' : 'Prompt ',
      \'rm' : 'More ',
      \'r?' : 'Confirm ',
      \'!' : 'Shell ',
      \'t' : 'Terminal '
      \}

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    hi Modi guifg=#efefef guibg=#2D2E27
    hi Filename guifg=#efefef guibg=#2D2E27
    return expand('%:t').'*'
  else
    hi Modi guifg=#929dcb guibg=#2D2E27
    hi Filename guifg=#929dcb guibg=#2D2E27
    return expand('%:t')
  endif
endfunction

" Set active statusline
function! ActiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Current mode
  let statusline .= "%#Mode# %{ModeCurrent()}"

  let statusline .= "%#Base#"

  " Align items to right
  let statusline .= "%="

  " Current modified status and filename
  let statusline .= "%#Modi# %{CheckMod(&modified)} "

  " Current filetype
  let statusline .= "%#Filetype# %{CheckFT(&filetype)} "

  " Current line and column
  let statusline .= "%#LineCol# Line %l, Column %c "
  return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Full path of the file
  let statusline .= "%#Filename# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END


" =============================================================================
" >>>> AUTOCOMMANDS 
" =============================================================================
autocmd FileType python map <buffer> <F9> :exec '!clear;python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:exec '!clear;python' shellescape(@%, 1)<CR>


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


" =============================================================================
" >>>> DUKE ECE 
" =============================================================================
"  Open netrw for Duke VM
nnoremap <F6> :e scp://nwl4@vcm-181.vm.duke.edu/ece551/ <CR>

" Compiling
nnoremap <F10> :!/usr/bin/gcc -o '%:r' -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror -pedantic -std=gnu99 -ggdb3 %<CR>

" -fsanitize=address
" nnoremap <F10> :!gcc -o '%:r' -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror -pedantic -std=gnu99 -fsanitize=address %<CR>
nnoremap <F22> :!./'%:r'<CR>
"         F22 is Shift + F10


" =============================================================================
" >>>> PLUGINS 
" =============================================================================
"
" -----------------------------------------------------------------------------
" >>>> SYNTASTIC (SYNTAX CHECKER)
" -----------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------------------------
" >>>> DEOPLETE (COMPLETION)
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" -----------------------------------------------------------------------------
" >>>> ULTISNIPS (SNIPPETS)
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<C-x>"
" let g:UltiSnipsExpandTrigger="<C-X>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-v>"

" -----------------------------------------------------------------------------
" >>>> NERDCOMMENTER (COMMENTING)
" -----------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
" /* Hi There!
" * This is a sexy comment
" * in c */
let g:NERDCompactSexyComs = 1


" =============================================================================
" >>>> QUARANTINE 
" =============================================================================

" -----------------------------------------------------------------------------
" >>>> YOU COMPLETE ME
" -----------------------------------------------------------------------------
" function! FormatOnSave()
"    :YcmCompleter Format
" endfunction
" autocmd BufWritePre *.h,*.c,*.cpp call FormatOnSave()

" -----------------------------------------------------------------------------
" >>>> GENERAL
" -----------------------------------------------------------------------------
" Set working directory
" autocmd BufEnter * silent! lcd %:p:h


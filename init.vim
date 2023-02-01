" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Plugin Management ==================
call plug#begin()

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jlanzarotta/bufexplorer'
Plug 'mhinz/vim-grepper'
"Plug 'ericbn/vim-relativize'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'habamax/vim-sendtoterm'
Plug 'peterhoeg/vim-qml'

call plug#end()

" =============== Plugin Mappings ====================
" === Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" =============== Plugin Options ====================
" ***** Airline *****
  let g:airline_theme='distinguished'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.colnr = '|'
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.maxlinenr = ''

  let g:airline#extensions#localsearch#loaded = 0
  let g:airline#extensions#localsearch#enabled = 0
  let g:airline#extensions#searchcount#loaded = 0
  let g:airline#extensions#searchcount#enabled = 0
  let g:airline_inactive_collapse=0

  let g:airline_section_a = airline#section#create(['mode', ' ', 'iminsert', '%f'])
  let g:airline_section_b = airline#section#create(['%m'])
  let g:airline_section_c = airline#section#create(['filetype'])
  let g:airline_section_x = airline#section#create(['%p%%'])
  let g:airline_section_y = airline#section#create_right(['%l:%v'])
  let g:airline_section_z = airline#section#create(['%L'])

" ***** END Airline *****

" ***** Signify     *****
  " Change these if you want
  let g:signify_sign_add               = '+'
  let g:signify_sign_delete            = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change            = '~'

  " I find the numbers disctracting
  let g:signify_sign_show_count = 0
  let g:signify_sign_show_text = 1


  " Jump though hunks
  nmap <leader>gj <plug>(signify-next-hunk)
  nmap <leader>gk <plug>(signify-prev-hunk)
  nmap <leader>gJ 9999<leader>gJ
  nmap <leader>gK 9999<leader>gk


  " If you like colors instead
  highlight SignifySignAdd                  ctermbg=green guibg=#00ff00
  highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
  highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
" ***** END Signify *****

" *****  netrw    *****
  let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"
" ***** END netrw *****

" ================ General Config ====================

set path+=**
set number                      "Line numbers are good
set relativenumber
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "Highlight the row the cursor is on
set cursorcolumn                "Highlight the column that the cursor is on
set guicursor=n-v-c-sm:hor1,i-ci-ve:ver25-Cursor,r-cr-o:block "Style the cursor correctly
set virtualedit=all             "Put the cursor anywhere in whitespace
set ls=2                        "status bar at bottom of buffer
"set statusline=%<%{&ff}:%{&fenc}:%Y\ \ \|\ \ %f%m\ \ \|\ \ %{strftime('%y/%m/%d\ %H:%M',\ getftime(expand('%')))}\ \ \|\ \ %=\ R:%l\/%L\ C:%c%V\ %P
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Set unix line endings
set ff=unix

" set complete+=kspell
set complete=.,w,b,u
set completeopt=menuone,longest,preview
"set completeopt=menuone,preview
set shortmess+=c

set guioptions-=m "turn off menu bar
set guioptions-=T "turn off tool bar
set guioptions-=r "turn off scroll bar
set guioptions-=L "turn off scroll bar

"turn on syntax highlighting
syntax on
set ruler
let g:gruvbox_contast_dark = 'hard'
colorscheme gruvbox

highlight highlighter guibg=SlateBlue

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on


set nowrap       "Don't wrap lines
"set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

"set foldmethod=indent   "fold based on indent
set foldmethod=manual   "fold based on manual
"set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.elf,*.lst,*.map
set wildignore+=*.a,*.pub,*.ilk
set wildignore+=*.out
set wildignore+=tags

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" ================ Mappings ===========================

" Paste from OS
noremap <c-P> :set paste<cr>o<c-r>"<esc>:set nopaste<cr>

" ESC Terminal Mode
tnoremap <Esc> <c-\><c-n>
" Save session
map <F8> :mksession! .\\_vim_session<cr>
" Restore session
map <F9> :source .\\_vim_session<cr>

"Set Leader character to space
let mapleader = "\<Space>"

"Faster file write
nnoremap <leader>w :w<cr>

"Use jk or kj to leave insert mode
inoremap jk <esc>
inoremap kj <esc>

" Explorer in this split
nnoremap <leader>ee :Explore<cr>

" Explorer in new vertical split
nnoremap <leader>ev :Vexplore<cr>

" Explorer in new horizontal split
nnoremap <leader>es :Sexplore<cr>

"Search for word under cursor recursively in current dir
noremap <F4> :vimgrep <cword> **/*<cr>

"Show all instances of <cword> in current file
noremap <F5> *N:vimgrep <cword> %<CR>

"Open the list of vimgrep matches
noremap <F6> :copen<cr>

"Move forward through vimgrep matches
noremap <c-n> :cn<cr>

"Move backward through vimgrep matches
noremap <c-b> :cN<cr>

"Rename thing under cursor locally
noremap <leader>rl :%s/\(\<<c-r><c-w>\>\)/

" Window changing
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Window Resizing
nmap <c-left> <c-w><
nmap <c-right> <c-w>>
nmap <c-up> <c-w>+
nmap <c-down> <c-w>-

noremap <c-w>m <c-w>_<c-w><bar>

" Buffer Switching
noremap <c-tab> :bn<cr>
noremap <c-s-tab> :bp<cr>

" Jump back from a tag
nmap <c-\> <c-t>

" Hightlight word under cursor and stay in same place
nnoremap * /\<<c-r><c-w>\><cr>N

" Turn off Seach hightlight
nnoremap <c-_> :noh<cr>

" Highlight Line under cursor
noremap <leader>hl :call matchadd('highlighter', '\%'.line('.').'l')<CR>

" Highlight Clear
noremap <leader>hc :call clearmatches()<CR>

" Copy selection to System Clipboard
noremap <leader>yt "+y

" Copy full buffer to System Clipboard
noremap <leader>ya ggVG"+y

" Like ya, but also force close the window
noremap <leader>yo ggVG"+y:q!<cr>

" Inner Paste. Replace inner word with clipboard
noremap <leader>ip ciw<c-r>0<esc>

"" sql_string add. Wraps the whole buffer to build a sql_string
"noremap <leader>ssa :%norm 0isql_str = sql_str & vbLf & "<cr>:%norm A"<cr>
"
"" sql_string delete. Removes the sql_string wrapper
"noremap <leader>ssd :%norm df"<cr>:%norm $x<cr>

""Align Block
noremap <leader>ab ms{mb}me`s:'b,'eAlign<cr>

" Close buffer and go to the last buffer
noremap <leader>d :b#<cr>:bdelete #<cr>:bn<cr>:bp<cr>

" Reformat file
noremap <leader>= ggVG=

" Get C function prototypes and put them in quickfix
noremap <leader>cgfp :vimgrep /^.* .*(.*)\n{/j %<cr>

" Vertial Tag split to right
noremap <c-w>v] <c-w>v<c-w>l<c-]>

" Vertial Tag split to left
noremap <c-w>v[ <c-w>v<c-]>

" Horizontal Tag split down
noremap <c-w>h[ <c-w>s<c-w>j<c-]>

" Horizontal Tag split up
noremap <c-w>h] <c-w>s<c-]>

" Grab tag
noremap <leader>[ "tyiw

" Drop tag
noremap <leader>] :tag <c-r>t<cr>

" Easiest Easymotion
nmap s <Plug>(easymotion-s)

" Easier Easymotion
map <leader> <Plug>(easymotion-prefix)

" Search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" ================ Command Mappings ==================
" Edit my vimrc
command! Config execute ":e $MYVIMRC"
" Source my vimrc
command! Reload execute ":source $MYVIMRC"

command! TW execute ":call Trim_whitespace()"

command! Banner execute ":norm o/<esc>79a*<esc>o<c-u>*<esc>o/<esc>79i*<esc>0k$"

command! -range -nargs=? Align call AlignThis(<line1>, <line2>)
command! -range -nargs=? Ent2Inst call VHDL_ent2inst(<line1>,<line2>)

command! W w

command! -nargs=1 Vgh call Vimgrep_here(<f-args>)
command! -nargs=1 Vgr call Vimgrep_dir(<f-args>)

command! -range -nargs=1 C :<line1>,<line2>s/^/<args>

command! Wcp e clip "+p

"" SVN Check Out Here : checks out an SVN directory to the current working directory
"command! -nargs=1 -complete=customlist,Complete_SVN_paths SVNcoh :execute "!svn co ".<q-args>.getcwd()
"
"" SVN Check Out There : checks out an SVN directory to the specified directory
"command! -nargs=1 -complete=customlist,Complete_SVN_paths SVNcot :execute "!svn co ".<q-args>
"
"" SVN Check In : checks in the current file
""  Takes check in comment as argument
"command! -nargs=1 SVNci :execute "!svn ci -m ".<q-args>." %"
"
"command! SVNadd :execute "!svn add %"


inoremap <c-up> <esc>:call GrabNeighbor(-1)<cr>
inoremap <c-down> <esc>:call GrabNeighbor(1)<cr>
"inoremap <c-o> <esc>:call PasteAutocomplete()<cr>

com! FormatXML :%!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" ================ Functions ======================

function! Complete_SVN_paths(ArgLead, CmdLine, CursorPos)

  return [
        \]
endfunction

function! Trim_whitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

function! Vimgrep_here(search_str)
  exe ':silent vimgrep ' . a:search_str . ' % | copen'
endfunction

function! Vimgrep_dir(search_str)
  exe ':silent vimgrep ' . a:search_str . ' **/* | copen'
endfunction

" Align lines with character under cursor at the cursor column
function! AlignThis(line1, line2)
  let l:cursor_pos = getcurpos()
  let l:column = l:cursor_pos[2]
  let l:character = matchstr(getline('.'), '\%' . col('.') . 'c.')

  exec printf('execute "%i,%i norm f%s40i \<esc>%i|dt%s"', a:line1, a:line2, l:character, l:column, l:character)
endf

function! GrabNeighbor(dir)

  let my_line = line('.')
  let their_line = my_line+a:dir
  let col = col('.')
  call cursor(their_line,col+1)
  normal y$
  call cursor(my_line,col)
  normal p
endf

function! PasteAutocomplete()

  " remember cursor position
  let line = line('.')
  let col = col('.')
  let base = expand("<cword>")
  normal diw
  let hits = []
  let flags = 'w'
  normal G$
  while search('\<'.base, flags) > 0
    let hit = expand("<cword>")
    call add(hits, hit)
    let flags = 'W'
  endwhile
  " restore cursor position
  call cursor(line,col)
  call sort(hits)
  call uniq(hits)
  execute 'let @a = join(uniq(hits), "\n") . "\n"'
  normal "ap

endfunction

function! NMode(id)
  let l:nmode = mode() =~# '[nvViR]'
  if l:nmode
    if !&rnu
      set relativenumber
    endif
  else
    if &rnu
      set norelativenumber
    endif
  endif
endfunction

function! VHDL_ent2inst(line1, line2)
  let my_line = line('.')
  let my_col = col('.')

  exec printf('%i,%is/:/=>  --', a:line1, a:line2)
  exec printf('%i,%is/entity /entity work.', a:line1, a:line2)
  exec printf('%i,%is/ is/', a:line1, a:line2)
  exec printf('%i,%is/generic/generic map', a:line1, a:line2)
  exec printf('%i,%is/port/port map', a:line1, a:line2)
  exec printf('%i,%is/);/)', a:line1, a:line2-1)
  exec printf('%i,%is/;/,', a:line1, a:line2-1)
  call cursor(a:line1,1)
  call search('entity')
  normal wwwywOinst_
  normal pa:
  call cursor(my_line, my_col)
endfunction

function! Set_fileformatting()
  set formatoptions=jcrn
  set textwidth=80

endfunction

"=========================
"call timer_start(100, function('NMode'), {'repeat': -1})

" ================ Autocmds ======================
augroup vimrc
  " Remove my autocmds first
  autocmd!

  autocmd BufWritePre   * :call Trim_whitespace()
  autocmd BufWritePost  *.c :call jobstart('ctags -R .')
  autocmd BufWritePost  *.cpp :call jobstart('ctags -R .')
  autocmd BufWritePost  *.h :call jobstart('ctags -R .')
  autocmd BufWritePost  *.py :call jobstart('ctags -R .')
  autocmd BufEnter      * :call Set_fileformatting()
augroup END

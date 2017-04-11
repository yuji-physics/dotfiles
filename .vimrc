" .vimrc
" === PLUGINS === {{{
let mapleader = ","
"let $PATH = "~/.pyenv/shims:".$PATH

if &compatible
  set nocompatible
endif

" Disable menu.vim of GUI.
if has('gui_running')
  set guioptions=Mc
endif

" Dein{{{
if has('win32')
  let s:dein_dir = expand('~/vimfiles/dein/repos/github.com/Shougo/dein.vim')
else
  let s:dein_dir = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim')
endif

if &runtimepath !~# '/dein.vim'
  " install dein.vim automatically if it does not exist
  if !isdirectory(s:dein_dir)
    execute ' !git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" start of plugins
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {
      \ 'build': {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin': 'make -f make_cygwin.mak',
      \     'mac': 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak',
      \     }})
call dein#add('Shougo/unite.vim', {
      \ 'depends': ['vimproc'],
      \ 'lazy': 1})
" unite sources
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neomru.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimshell', {
      \ 'lazy': 1})

call dein#add('junegunn/vim-easy-align')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('thinca/vim-quickrun')
" syntastic is much heavier than watchdogs
"call dein#add('scrooloose/syntastic')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
"call dein#add('cohama/vim-hier')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')
call dein#add('itchyny/lightline.vim')
call dein#add('jtratner/vim-flavored-markdown.git')
"call dein#add('lambdalisue/vim-pyenv', {
"      \ 'autoload': {
"      \     'filetypes': ['python', 'python3', 'djangohtml']
"      \     },
"      \ 'merged': 0})

" Folding
call dein#add('Konfekt/FastFold')
call dein#add('tmhedberg/SimpylFold')
call dein#add('matze/vim-tex-fold')
" Color schemes
call dein#add('w0ng/vim-hybrid')
call dein#add('altercation/vim-colors-solarized')

call dein#end()
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" end of plugins
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" }}}
filetype plugin indent on
" Unite {{{
"let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" let g:unite_winwidth = 40
nnoremap <silent> <leader>ua :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <leader>ur :<C-u>Unite register<CR>
nnoremap <silent> <leader>uh :<C-u>Unite history/yank<CR>
nnoremap <silent> <leader>ut :<C-u>Unite tab<CR>
" }}}
" Vimfiler{{{
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nnoremap <silent> <leader>e :<C-u>VimFilerBufferDir -split -simple -winwidth=40<CR>
" }}}
" Neocompete {{{
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" Use ignorecase
let g:neocomplete#enable_ignore_case = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1

" maximum number of candidates displayed in a pop-up menu
let g:neocomplete#max_list = 30
" maximum width of a pop-up menu
let g:neocomplete#max_keyword_width = 80
" complete start length
let g:neocomplete#auto_completion_start_length = 2

" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#lock_buffer_name_pattern = "\*ku\*"

" Define dictionary (same as help file)
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \}
" Define keyword (same as help file)
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'


" Use omnifunc
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns= {}
endif
" C
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
" C++
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" go
let g:neocomplete#force_omni_input_patterns.go = '\h\w\.\w*'
" python
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"Tex
let g:neocomplete#force_omni_input_patterns.tex = '\\\?\h\w*'

" Key Mappings
" select a candidate by <CR>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" close pop-up and a backword char by <BS>
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" close pop-up by <Space>
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"

" manual completion
inoremap <expr><C-c>  neocomplete#start_manual_complete()
"}}}
" Neosnippet{{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" My own snippets
let s:my_snippet = '~/.vim/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
"}}}
" vim-easy-align {{{
vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}
" vim-easy-motion{{{
let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-bd-fl)
map t <Plug>(easymotion-bd-tl)
nmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
map <silent><leader>j <Plug>(easymotion-j)
map <silent><leader>k <Plug>(easymotion-k)
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" }}}
" vim-repeat{{{
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count) 
" "}}}
" vim-quickrun {{{
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nmap <Leader>rm <Plug>(quickrun)
let g:quickrun_config = {
      \ '_' : {
      \   'runner' : 'vimproc',
      \   'runner/vimproc/updatetime' : 60,
      \   'split' : '5sp',
      \ },
      \ 'tex' : {
      \   'command' : 'latexmk',
      \   'cmdopt' : ' -f',
      \   'exec' : '%c %o %s'
      \ }
      \}
" }}}
" Syntastic{{{
"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_wq=0
"let g:syntastic_c_check_header=1
"let g:syntastic_mode_map = {
"      \ "mode": "active",
"      \ "passive_filetypes": ["tex"] }
"if !empty($QTDIR)
"  let g:syntastic_cpp_include_dirs=['include','$QTDIR/include']
"endif
"let g:syntastic_python_quiet_messages={"level": "errors"}
"let g:syntastic_python_pylint_quiet_messages={"level": []}
"nnoremap <silent> <leader>se :<C-u>Errors<CR>
" }}}
" vim-watchdogs {{{
if !exists("g:quickrun_config")
  let g:quickrun_config = {}
endif
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "outputter/quickfix/open_cmd" : "",
      \ "errorformat": '%f:%l%m',
      \}
let g:watchdogs_check_BufWritePost_enable = 1
call watchdogs#setup(g:quickrun_config)
" highlight errors
let g:hier_enabled = 1
"}}}
" Lightline{{{
" copy of http://itchyny.hatenablog.com/entry/20130828/1377653592
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'fugitive', 'filename'] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode'
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction"
" }}}
" }}}
" === OPTIONS ( + etc.) === {{{
" Languages
if has('win32') && !has("gui_running")
  " use sjis in Windows
  set termencoding=sjis
else
  set termencoding=utf-8
endif
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp932,sjis,euc-jp
set helplang=en

" Appearances
" colorscheme and highlight
if !empty($CONEMUBUILD) || &t_Co > 2 || has("gui_running")
  set term=xterm
  set t_Co=256
  syntax on
  set hlsearch
  "let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized
  "colorscheme hybrid
  " Variables required to display 256 colors in ConEmu(Windows).
  if !empty($CONEMUBUILD)
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif
endif

" cursor line and cursor column
"set cursorline
"set cursorcolumn
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=236
"highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236

set number " show columnnumber
set numberwidth=1 " minimal number to show column number.
set laststatus=2 " always show status line
set cmdheight=2
set wrap
set textwidth=0
set list " show special characters
if !has('win32') || has('gui_running')
  set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
else
  " Some special characters are not supported on Windows
  set listchars=tab:^-,trail:-,extends:»,precedes:«,nbsp:%,eol:$
endif
set notitle
set showcmd
set ruler " show current position (column and raw number)
set showmatch " highlight matched pair when inserted?
set matchtime=1 " 5 by default
set matchpairs=(:),{:},[:],<:>,":",':',`:`

" <tab> key
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set shiftround

" indent
set autoindent
set smartindent

" split window
set splitbelow
set splitright

" Buffer
set hidden " open new buffer with :e command even if current buffer is not saved.

" folding
set foldenable
set foldlevel=0 " fold everything when opening a file
set foldmethod=marker " 'syntax' and 'expr' are sometimes too slow
set foldmarker={{{,}}}
set foldcolumn=5 " width of the leftside columns of folding guide

" Load and save
set autoread " when a file is modified outside Vim, reload the file automatically.
"set autowriteall
set nobackup
set noswapfile
set noundofile

set pastetoggle=<F8>

" Search
set incsearch " incremental search
set ignorecase " match both upper/lowercase letters
set smartcase " if the pattern contains capital letters, do not ignore case.
set wrapscan

" cmd completion
set wildmode=list,full
set wildmenu
set wildignore=*.o,*.obj,*/.git/*,*.pyc,*.png,*.jpg,*.aux,.DS_Store


" misc
set mouse=a
set backspace=indent,eol,start
"set clipboard+=unnamed
set history=50
set vb t_vb=
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" }}}
" === AUTO COMMANDS ==={{{
augroup MyAutoCmd
  autocmd!
augroup END

" Use github-flavored markdown (ghmarkdown)
"autocmd MyAutoCmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufReadPost *.md,*.markdown setlocal filetype=ghmarkdown
autocmd MyAutoCmd BufNewFile,BufReadPost *.tex setlocal filetype=tex
autocmd MyAutoCmd BufNewFile,BufReadPost *.class setlocal filetype=class

" Enable omni completions
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd MyAutoCmd FileType python setlocal omnifunc=python3complete#Complete
"autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete

" vimgrep & quickfix
function! OpenModifiableQF()
  cw
  set modifiable
  set nowrap
endfunction
autocmd MyAutoCmd QuickFixCmdPost vimgrep call OpenModifiableQF()
" }}}
" === KEY MAPPINGS === {{{
" emacs-like maps on command-line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" paste
cnoremap <C-y> <C-r>*

" treat wrapping line as a line when moving a cursor
nnoremap j gj
nnoremap k gk

" place cursor on the middle of the screen after some motions
nnoremap g; g;zz
nnoremap G Gzz

" vimgrep results
nnoremap <Space>n :cnext<CR>
nnoremap <Space><S-n> :cprevious<CR>

" resize window with cursor keys in normal mode
nnoremap <silent> <Left> :5wincmd <<CR>
nnoremap <silent> <Right> :5wincmd ><CR>
nnoremap <silent> <Up> :5wincmd +<CR>
nnoremap <silent> <Down> :5wincmd -<CR>

" insert <Space> and <Enter> in the normal mode
nnoremap <Space><Space> i<Space><ESC><Right>
nnoremap <CR> i<CR><ESC>

" escape insert mode with jj
"inoremap jj <Esc>

" for ANSI keyboard
nnoremap ; :

" use <Tab> and <S-Tab> in pop-up menu
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" complete brackets and quotations
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap () ()<Left>

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap {} {}<Left>

inoremap [] []<Left>

inoremap <> <><Left>

inoremap $$ $$<Left>

inoremap "<Enter> ""<Left><CR><ESC><S-o>
inoremap "" ""<Left>

inoremap '<Enter> ''<Left><CR><ESC><S-o>
inoremap '' ''<Left>

inoremap `<Enter> ``<Left><CR><ESC><S-o>
inoremap `` ``<Left>

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
vnoremap g<c-a> g<c-a>gv
vnoremap g<c-x> g<c-x>gv
vnoremap > >gv
vnoremap < <gv
" toggles
" <F7>: vimfiler
" <F8>: paste
" <F9>
" <F10>: Neocomplete
" <F11>
" <F12>
"
" toggle vimfiler safe mode
nnoremap <F7> <Plug>(vimfiler_toggle_safe_mode)
" toggle neocomplete
nnoremap <F10> :NeoCompleteToggle<CR>
" }}}

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

"-----------------------------------------
" plugins
"-----------------------------------------
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {
      \ 'build': {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin': 'make -f make_cygwin.mak',
      \     'mac': 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak',
      \     }})

" Denite and its sources
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neomru.vim')

" Completions
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('zchee/deoplete-jedi')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" Tools
call dein#add('thinca/vim-quickrun')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('junegunn/vim-easy-align')
call dein#add('itchyny/lightline.vim')

" Folding
call dein#add('Konfekt/FastFold')
call dein#add('tmhedberg/SimpylFold')
call dein#add('matze/vim-tex-fold')

" Color schemes
call dein#add('w0ng/vim-hybrid')
call dein#add('altercation/vim-colors-solarized')

" Syntacs
call dein#add('jtratner/vim-flavored-markdown.git')

" Syntacs checker
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')

" Go
call dein#add('fatih/vim-go')

" python with pyenv
"call dein#add('lambdalisue/vim-pyenv', {
"      \ 'autoload': {
"      \     'filetypes': ['python', 'python3', 'djangohtml']
"      \     },
"      \ 'merged': 0})

call dein#end()
" }}}
filetype plugin indent on
" Denite {{{
if executable('rg')
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
else
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--nogroup', '--nocolor'])
endif
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap')
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap')
" I use <C-o> as tmux prefix key.
" So, set <Esc> to insert -> normal
" Type q or <esc> in normal mode to quit denite
call denite#custom#map(
      \ 'insert',
      \ '<Esc>',
      \ '<denite:enter_mode:normal>',
      \ 'noremap')
call denite#custom#map(
      \ 'normal',
      \ 'a',
      \ '<denite:choose_action>',
      \ 'noremap')
call denite#custom#map(
      \ 'normal',
      \ '<Esc>',
      \ '<denite:quit>',
      \ 'noremap')
call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('search', 'prompt', '>')
nnoremap <silent> <leader>ua :<C-u>Denite -mode=normal file_mru<CR>
nnoremap <silent> <leader>uf :<C-u>Denite -mode=normal -buffer-name=file file<CR>
nnoremap <silent> <leader>ub :<C-u>Denite -mode=normal buffer<CR>
nnoremap <silent> <leader>ug :<C-u>Denite -mode=normal grep<CR>
nnoremap <silent> <leader>ur :<C-u>Denite -mode=normal register<CR>
nnoremap <silent> <leader>uh :<C-u>Denite -mode=normal neoyank<CR>
nnoremap <silent> / :<C-u>Denite -buffer-name=search
      \ -auto-highlight line<CR>
nnoremap <silent> n :<C-u>Denite -buffer-name=search
      \ -resume -mode=normal -refresh<CR>
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'complete'
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
autocmd CompleteDone * silent! pclose!
" }}}
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
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=222
"highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236

"set number
set numberwidth=1 " minimal number to show column number.
set laststatus=2 " always show status line
set cmdheight=2
set wrap
set textwidth=0
set list " show special characters
if (!has('win32') && !has('win64')) || has('gui_running')
  set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"elseif has('win32') || has('win64')
"  " '»' and '↲' are sometimes garbled on windows terminals.
"  set listchars=tab:^-,trail:-,extends:»,precedes:«,nbsp:%,eol:$
endif
set notitle
set showcmd
set ruler " show current position (column and raw number)
set showmatch " highlight matched pair when inserted?
set matchtime=1 " 5 by default
set matchpairs=(:),{:},[:],<:>

" <tab> style
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set shiftround

" indent
set autoindent
set smartindent

" location of split window
set splitbelow
set splitright

" buffer
set hidden " open new buffer with :e command even if current buffer is not saved.

" folding
set foldenable
set foldlevel=0 " fold everything when opening a file
set foldmethod=marker " 'syntax' and 'expr' are much expensive
"set foldmethod=indent
set foldmarker={{{,}}}
set foldcolumn=5 " width of the leftside columns of folding guide

" Load and save
set autoread " when a file is modified by another vim process, reload it automatically.
"set autowriteall
set nobackup
set noswapfile " do not create .swap file
set noundofile " do not create .undo file

set pastetoggle=<F8> " toggle paset mode

" Search (e.g. '/' command)
set incsearch  " enable incremental search
set ignorecase " match both upper/lowercase letters
set smartcase  " if the match pattern contains capital letters, disable ignore case.
set wrapscan   " back to the first search result after the final one.

" cmd completion
set wildmode=list,full
set wildmenu
set wildignorecase
set wildignore=*.o,*.obj,*/.git/*,*.pyc,*.png,*.jpg,*.aux,.DS_Store " do not show these files, which are usually not opened by vim

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
autocmd MyAutoCmd BufNewFile,BufReadPost *.gpl setlocal filetype=gnuplot

" Enable omni completions
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd MyAutoCmd FileType tex setlocal omnifunc=texcomplete#Complete
"autocmd MyAutoCmd FileType python setlocal omnifunc=python3complete#Complete
"autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete

" vimgrep & quickfix
function! OpenModifiableQF()
  cw
  set modifiable
  set nowrap
endfunction
autocmd MyAutoCmd QuickFixCmdPost vimgrep call OpenModifiableQF()

" fold by indent if filetype=C/C++
autocmd MyAutoCmd BufNewFile,BufReadPost *.c,*.cpp,*.h,*.hpp setlocal foldmethod=indent

" Enable transparent background in gnome-terminal
autocmd MyAutoCmd VimEnter,ColorScheme * highlight Normal ctermbg=NONE
autocmd MyAutoCmd VimEnter,ColorScheme * highlight NonText ctermbg=NONE
autocmd MyAutoCmd VimEnter,ColorScheme * highlight TablineSel ctermbg=NONE
autocmd MyAutoCmd VimEnter,ColorScheme * highlight LineNr ctermbg=NONE
autocmd MyAutoCmd VimEnter,ColorScheme * highlight CursorLineNr ctermbg=NONE

" yapf code formatter for python
autocmd FileType python nnoremap <leader>f :0,$!yapf<Cr>
" }}}
" === KEY MAPPINGS === {{{
" emacs-like keybindins on command-line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" paste
cnoremap <C-y> <C-r>*

" think wrapping line as a line when moving up/down
nnoremap j gj
nnoremap k gk

" place cursor on the middle of the screen after some big motions
nnoremap g; g;zz
nnoremap G Gzz

" jump over vimgrep results by space+n/N
nnoremap <Space>n :cnext<CR>
nnoremap <Space><S-n> :cprevious<CR>

" resize window with arrow keys in normal mode
nnoremap <silent> <Left> :5wincmd <<CR>
nnoremap <silent> <Right> :5wincmd ><CR>
nnoremap <silent> <Up> :5wincmd +<CR>
nnoremap <silent> <Down> :5wincmd -<CR>

" insert <Space> from normal mode by double <Space>
nnoremap <Space><Space> i<Space><ESC><Right>

" escape insert mode with jj
"inoremap jj <Esc>

" for ANSI keyboard
nnoremap ; :

" use <Tab> and <S-Tab> in pop-up menu
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" brackets and '$' (for TeX)
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap () ()<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap $$ $$<Left>

" quotations (", ', `)
inoremap "<Enter> ""<Left><CR><ESC><S-o>
inoremap "" ""<Left>
inoremap '<Enter> ''<Left><CR><ESC><S-o>
inoremap '' ''<Left>
inoremap `<Enter> ``<Left><CR><ESC><S-o>
inoremap `` ``<Left>

" stay visual mode after some actions
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
vnoremap g<c-a> g<c-a>gv
vnoremap g<c-x> g<c-x>gv
vnoremap > >gv
vnoremap < <gv

" open terminal
nnoremap <silent> <leader>t :<C-u>terminal ++close<CR>
" }}}

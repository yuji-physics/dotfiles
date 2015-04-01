" .vimrc
" === PLUGINS === {{{
" NeoBundle{{{
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  if has('win32')
    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim/  
  endif
endif

if has('win32')
  call neobundle#begin(expand('~/vimfiles/bundle/'))
else
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'windows' : 'make -f make_mingw32.mak',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ }}
" neocomplete needs lua
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'matze/vim-tex-fold'
NeoBundle 'AndrewRadev/switch.vim'

" Plugins I'm interested in now.
"NeoBundle 'pelodelfuego/vim-swoop'
"NeoBundle 'szw/vim-ctrlspace'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" Color schemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'jonathanfilip/vim-lucius'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
NeoBundleClean
" }}}
" Unite {{{
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" let g:unite_winwidth = 40
" }}}
" Vimfiler{{{
" let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
" }}}
" Neocompete or Neocomplcache{{{
if neobundle#is_installed('neocomplete')
  " Disable AutoComplPop
  let g:acp_enableAtStartup = 0
  " Use neocomplete
  let g:neocomplete#enable_at_startup = 1
  " Use ignorecase
  let g:neocomplete#enable_ignore_case = 1
  " Use smartcase
  let g:neocomplete#enable_smart_case = 1

  " Pop-up Appearances
  " maximum number of candidates displayed in a pop-up menu
  let g:neocomplete#max_list = 30
  " maximum width of a pop-up menu
  let g:neocomplete#max_keyword_width = 80

  " Set minimum syntax keyword length
  let g:neocomplete#sources#syntax#min_keyword_length = 3
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

  " jedi setting
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns= {}
  endif
  let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

  " Key Mappings
  " select a candidate by <CR>
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction

  " close pop-up and a backword char by <BS>
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  " close pop-up by <Space>
  inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " manual completion
  inoremap <expr><C-c>  neocomplete#start_manual_complete()

elseif neobundle#is_installed('neocomplcache')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
"}}}
" jedi-vim{{{
" use jedi completions in Neocompete 
let g:jedi#completions_enabled = 0
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:popup_on_dot = 0
let g:jedi#popup_select_first = 0
" }}}
" vim-easy-align {{{
vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" Usage of vim-easy-align{{{
" 1. Select a region you want to align in the visual mode.
" 2. <CR>(<CR><CR>)<# or  * or **><align target>
"
"         <CR>: right alignment
"     <CR><CR>: left alignment
" <CR><CR><CR>: center alignment
"            #: align a #th <align target>
"            *: align all targets
"           **: align all targets in right and left alignment alternately
" for e.g. select some equations in visual mode and press <CR><CR>**=
" }}}
" }}}
" vim-easy-motion{{{
let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-bd-fl)
map t <Plug>(easymotion-bd-tl)
nmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" define colors in ~/.vim/after/colors/hybrid.vim
" to define colors in .vimrc, use links below.
" hi link EasyMotionTarget ErrorMsg
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First MatchParen
" hi link EasyMotionTarget2Second MatchParen
" hi link EasyMotionIncCursor MyEasyMotionIncCursor
" }}}
" vim-repeat{{{
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count) 
" "}}}
" vim-over {{{
nnoremap <Leader>m :OverCommandLine<CR>
" }}}
" anzu{{{
" settings about anzu are also wrote in Lightline (anzu-status)
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nnoremap <Esc><Esc> <Plug>(anzu#clear_search_status)
" }}}
" vim-multiple-cursors{{{
" sometimes useful than <VISUAL BLOCK MODE>
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" usage{{{
" 1. <C-n> to begin or add multiple cursor.
" 2. <C-p> to delete cursor, if necessary.
" 3. (a) 'v' to select the region (), and 'i' or 'a' to go to <INSERT MODE>
"    (b) 's' or 'c' to directly go to <INSERT MODE>
" 4. Edit in multiple cursor.
" 5. <Esc> to quit multiple cursor.
" }}}
" }}}
" Syntastic{{{
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header=1
" }}}
" vim-indent-guides{{{
" define colors by myself
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234 " same as background
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1 " when 0, same as shiftwidth
let g:indentguides_start_level = 2
let g:indent_guides_space_guides = 1
" }}}
" Lightline{{{
" from http://itchyny.hatenablog.com/entry/20130828/1377653592
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'fugitive', 'filename', 'anzu' ] ]
        \ },
        \ 'component_function': {
        \   'anzu': 'anzu#search_status',
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
" Vim-LaTeX{{{

"filetype plugin on
"filetype indent on
"set shellslash
"set grepprg=grep\ -nH\ $*
""let g:tex_flavor='latex'
"let g:Imap_UsePlaceHolders = 1
"let g:Imap_DeleteEmptyPlaceHolders = 1
"let g:Imap_StickyPlaceHolders = 0
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_dvi = 'platex  --interaction=nonstopmode $*'
"let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex -U $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
" }}}
" Vim-tex-fold {{{
let g:tex_fold_additional_envs=1
" }}}
" switch {{{
let g:switch_definitions = [
        \['=', ' = '],
        \['+', ' + '],
        \['-', ' - '],
        \['*', ' * '],
        \['/', ' / '],
      \]
nnoremap <leader>s :Switch<CR>
" }}}
" }}}
" === AUTO COMMANDS ==={{{
augroup MyAutoCmd
  autocmd!
augroup END

" load ~/.vim/after/"colorscheme" not to change original colorscheme
function! s:load_after_colors()
  if has('win32')
    let color = expand('~/vimfiles/after/colors/' . g:colors_name . '.vim')
   else
    let color = expand('~/.vim/after/colors/' . g:colors_name . '.vim')
  endif
  if filereadable(color)
    execute 'source ' color
  endif
endfunction

autocmd MyAutoCmd VimEnter * call s:load_after_colors()
autocmd MyAutoCmd ColorScheme * call s:load_after_colors()

" Enable omni completions
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" use jedi for python
autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions
"autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete

" clear anzu-status automatically
autocmd MyAutoCmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()

" }}}
" === OPTIONS ( + etc.) === {{{
" Languages
if has('win32') && !has("gui_running")
  " use sjis in Windows-cui
  set termencoding=sjis
else
  set termencoding=utf-8
endif
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp932,sjis,euc-jp

" Appearances
" colorscheme and highlight
if !empty($CONEMUBUILD)
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  syntax on
  set hlsearch
  set background=dark
  colorscheme hybrid
elseif &t_Co > 2 || has("gui_running")
  set term=xterm
  set t_Co=256
  syntax on
  set hlsearch
  set background=dark
  colorscheme hybrid
endif

" cursor line and cursor column
set cursorline
if !has('win32') || has("gui_running")
  " cursorcolumn behaves badly in Windows-cui
  set cursorcolumn
endif
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=236
highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236

set number " show columnnumber
set numberwidth=1 " minimal number to show column number.
set laststatus=2 " always show status line
set cmdheight=2
set nowrap
set textwidth=0
" show special characters
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set notitle
set showcmd
set ruler " show current position (column and raw number)
set showmatch " highlight matched pair when inserted?
set matchtime=1 " 5 by default
set matchpairs=(:),{:},[:],<:>,":",':',`:`

" tab
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab

" indent
set autoindent
set smartindent
let mapleader = ","

" window
set splitbelow
set splitright

" fold
" when using syntax foldmethod, let variables below = true
"let javascript_fold=1
"let perl_fold=1
"let php_folding=1
"let r_syntax_folding=1
"let ruby_fold=1
"let sh_fold_enabled=1
"let vimsyn_folding='af'
"let xml_syntax_folding=1
set foldenable
set foldlevel=0 " fold everything when opening a file
set foldmethod=marker
set foldcolumn=4 " width of the leftside columns for folding
set foldmarker={{{,}}}

" Load and save
set autoread " when a file is modified outside Vim, reload the file automatically.
set autowriteall
set nobackup
set noswapfile
set noundofile

set pastetoggle=<F8>

" Search
set incsearch " incremental search
set ignorecase " match both upper/lowercase letters
set smartcase " if the pattern contains capital letters, do not ignore case.

" cmd completion
set wildmode=list,full
set wildmenu


" misc
set mouse=a
set backspace=indent,eol,start
set history=50

" }}}
" === KEY MAPPINGS === {{{
" move cursor on displayed lines (think wrapped line as a line)
nnoremap j gj
nnoremap k gk

" place cursor on the middle of the screen after some motions
nnoremap g; g;zz
nnoremap G Gzz

" resize window with cursor keys in normal mode
nnoremap <silent> <Left> :5wincmd <<CR>
nnoremap <silent> <Right> :5wincmd ><CR>
nnoremap <silent> <Up> :5wincmd +<CR>
nnoremap <silent> <Down> :5wincmd -<CR>

" insert <Space> and <Enter> in the normal mode
nnoremap <Space> i<Space><ESC><Right>
nnoremap <CR> i<CR><ESC>

" back to normal mode from insert mode
inoremap jj <Esc>

" move outside brackets or quotations in insert mode
"inoremap hh
"inoremap ll

" move cursor in insert mode
" waste of inoremap keys?
"inoremap <C-h> <Esc>ha
"inoremap <C-j> <Esc>ja
"inoremap <C-k> <Esc>ka
"inoremap <C-l> <Esc>la

" use <Tab> and <S-Tab> in pop-up menu
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" auto completions about brackets and quotations etc.
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

" toggle neocomplete
nnoremap <F10> :NeoCompleteToggle<CR>
" toggle hilightsearch
"let g:hlstate = 0
"nnoremap <expr><F9> call toggle_hilight_search()
"function! s:toggle_hilight_search()
" if (g:hlstate == 0)
"  return nohlsearch
" else
"  return set hlsearch
" endif
" let g:hlstate = 1 - hlstate
"endfunction
" }}}

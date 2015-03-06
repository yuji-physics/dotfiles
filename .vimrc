" .vimrc
" === PLUGINS === {{{
" NeoBundle{{{
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'

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
"NeoBundle 'pelodelfuego/vim-swoop'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'matze/vim-tex-fold'
"NeoBundle 'yuratomo/w3m.vim'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"NeoBundle 'szw/vim-ctrlspace'
"NeoBundle 'rbtnn/rabbit-ui.vim'
"NeoBundle 'rbtnn/rabbit-ui-collection.vim'

" color schemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'jonathanfilip/vim-lucius'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
" }}}
" Unite {{{

" let g:unite_winwidth = 40

" }}}
" Vimfiler{{{

" let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
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
" use jedi in Neocompete 
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

" colors are modified in ~/.vim/after/colors/hybrid.vim instead
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
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nnoremap <Esc><Esc> <Plug>(anzu#clear_search_status)
" }}}
" vim-multiple-cursors{{{
" use this plugin instead of <VISUAL BLOCK MODE>
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" usage{{{
" 1. <C-n> to start or add multiple cursor
" 2. <C-p> to delete cursor if necessary
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
" manually define colors
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234 " same as background
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1 " when 0, same as shiftwidth
let g:indentguides_start_level = 2
let g:indent_guides_space_guides = 1
" }}}
" raibow_parentheses{{{
let g:rbpt_colorpairs=[
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \] 
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
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
" }}}
" === AUTO COMMANDS ==={{{
augroup MyAutoCmd
  autocmd!
augroup END

" load ~/.vim/after/"colorscheme" not to change original colorscheme
function! s:load_after_colors()
  let color = expand('~/.vim/after/colors/' . g:colors_name . '.vim')
  if filereadable(color)
    execute 'source ' color
  endif
endfunction

autocmd MyAutoCmd VimEnter * call s:load_after_colors()
autocmd MyAutoCmd ColorScheme * call s:load_after_colors()

" enable omni completions
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" use jedi for python completion
autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions
" autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete

" always on raibow_parentheses
autocmd MyAutoCmd VimEnter * RainbowParenthesesToggle
autocmd MyAutoCmd syntax * RainbowParenthesesLoadRound
autocmd MyAutoCmd syntax * RainbowParenthesesLoadSquare
autocmd MyAutoCmd syntax * RainbowParenthesesLoadBraces

" clear anzu search
autocmd MyAutoCmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()

" }}}
" === OPTIONS ( + etc.) === {{{
let mapleader = ","

" --- 1. important ---
set pastetoggle=<F8>

" --- 2. moving around, searching and patterns ---
set noautochdir " Vimfiler does not work if autochdir is set.
set incsearch
set ignorecase
set smartcase

" --- 3. tags ---

" --- 4. displaying text ---
set nowrap
set cmdheight=2
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set number

" --- 5. syntax, highlighting and spelling ---
if &t_Co > 2 || has("gui_running")
  set t_Co=256
  syntax on
  set hlsearch
endif
set background=dark
colorscheme hybrid

set cursorline
set cursorcolumn
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=236
highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236

" --- 6. multiple windows ---
set laststatus=2
set splitbelow
set splitright

" --- 7. multiple tab pages ---

" --- 8. terminal ---
set term=xterm-256color
set notitle

" --- 9. terminal ---
set mouse=a

" --- 10. printing ---

" --- 11. messages and info ---
set showcmd
set ruler

" --- 12. selecting text ---

" --- 13 editing text ---
set backspace=indent,eol,start
set showmatch
set matchpairs=(:),{:},[:],<:>,":",':',`:`
set textwidth=0

" --- 14 tabs and indenting ---
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set autoindent
set smartindent
set nocindent

" --- 15 folding ---
"let javascript_fold=1
"let perl_fold=1
"let php_folding=1
"let r_syntax_folding=1
"let ruby_fold=1
"let sh_fold_enabled=1
"let vimsyn_folding='af'
"let xml_syntax_folding=1
set foldenable
set foldlevel=0
set foldmethod=marker
"set foldmethod=syntax
set foldcolumn=4
set foldmarker={{{,}}}

" --- 16 diff mode ---

" --- 17 mapping ---

" --- 18 reading and writing files ---
set nobackup

" --- 19 the swap file ---
set noswapfile

" --- 20 command line editing ---
set history=50
set wildmode=full
set wildmenu
set noundofile

" --- 21 executing external commands ---

" --- 22 running make and jumping to errors ---

" --- 23 language specific ---

" --- 24 multi-byte characters ---
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp932,sjis,euc-jp

" --- 25 various ---

" }}}
" === KEY MAPPINGS === {{{
" move cursor on wrapping line
nnoremap j gj
nnoremap k gk

" move cursor to the middle screen after a search motion
nnoremap g; g;zz
"nnoremap n nzz
"nnoremap N Nzz

" resize window with cursor keys in normal mode
nnoremap <silent> <Left> :5wincmd <<CR>
nnoremap <silent> <Right> :5wincmd ><CR>
nnoremap <silent> <Up> :5wincmd +<CR>
nnoremap <silent> <Down> :5wincmd -<CR>

" insert <Space> and <Enter> in the normal mode
nnoremap <Space> i<Space><ESC><Right>
nnoremap <CR> i<CR><ESC>

" escape normal mode from insert mode with jj
inoremap jj <Esc>

" move outside brackets or quotations in insert mode
"inoremap hh
"inoremap ll

" move cursor in insert mode
"inoremap <C-h> <Esc>ha
"inoremap <C-j> <Esc>ja
"inoremap <C-k> <Esc>ka
"inoremap <C-l> <Esc>la

" use <Tab> and <S-Tab> in pop-up menu
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" brackets and quotations etc.
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

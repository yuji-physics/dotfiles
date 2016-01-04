" .vimrc
" === PLUGINS === {{{
let mapleader = ","
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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'windows' : 'make -f make_mingw32.mak',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ }}
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'matze/vim-tex-fold'
NeoBundle 'jtratner/vim-flavored-markdown.git'
NeoBundle 'vim-jp/vim-go-extra'

" Color schemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'sickill/vim-monokai'
"NeoBundle 'chriskempson/vim-tomorrow-theme'

call neobundle#end()

" Disable menu.vim in GUI mode.
if has('gui_running')
  set guioptions=Mc
endif

filetype plugin indent on

NeoBundleCheck
" }}}
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
nnoremap <silent> <leader>uc :<C-u>Unite colorscheme<CR>
nnoremap <silent> <leader>uo :<C-u>Unite outline<CR>
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
  " disable jedi (python)
  "let g:jedi#completions_enabled = 0
  "let g:jedi#auto_vim_configuration = 0

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
  inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " manual completion
  inoremap <expr><C-c>  neocomplete#start_manual_complete()

endif
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
" anzu{{{
" Lightline also have anzu settings (to show anzu-status in Lightline).
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
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
" }}}
" Syntastic{{{
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header=1
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["tex"] }
if !empty($QTDIR)
  let g:syntastic_cpp_include_dirs=['include','$QTDIR/include']
endif
nnoremap <silent> <leader>se :<C-u>Errors<CR>
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
" Vim-tex-fold {{{
let g:tex_fold_additional_envs=1
" }}}
" vim-quickrun {{{
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nmap <Leader>rm <Plug>(quickrun)
nnoremap <silent> <Leader>rc :QuickRun -type texclean<CR>
nnoremap <silent> <Leader>ri :QuickRun -type texcleancache<CR>
let g:quickrun_config = {
      \ '_' : {
      \   'runner' : 'vimproc',
      \   'runner/vimproc/updatetime' : 60,
      \   'split' : 'vertical 60sp',
      \ },
      \ 'tex' : {
      \   'command' : 'latexmk',
      \   'cmdopt' : ' -f',
      \   'exec' : '%c %o %s'
      \},
      \ 'texclean' : {
      \   'command' : 'latexmk',
      \   'cmdopt' : ' -c',
      \   'exec' : '%c %o %s'
      \ },
      \ 'texcleancache' : {
      \   'command' : 'dvipdfmx',
      \   'cmdopt' : ' -I 0',
      \   'exec' : '%c %o %S:p:r.dvi'
      \ }
      \}
" }}}
" }}}
" === AUTO COMMANDS ==={{{
augroup MyAutoCmd
  autocmd!
augroup END

" Enable markdown
"autocmd MyAutoCmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufReadPost *.md,*.markdown setlocal filetype=ghmarkdown
autocmd MyAutoCmd BufNewFile,BufReadPost *.tex setlocal filetype=tex

" Load ~/.vim/after/"colorscheme" to modify the colorscheme without changing original syntax file.
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
autocmd MyAutoCmd FileType html,markdown,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd MyAutoCmd FileType tex setlocal omnifunc=texcomplete#Complete
"autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions

" clear anzu-status automatically
autocmd MyAutoCmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()

" vimgrep & quickfix
function! OpenModifiableQF()
  cw
  set modifiable
  set nowrap
endfunction
autocmd MyAutoCmd QuickFixCmdPost vimgrep call OpenModifiableQF()
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
set helplang=en

" Appearances
" colorscheme and highlight
if !empty($CONEMUBUILD) || &t_Co > 2 || has("gui_running")
  set term=xterm
  set t_Co=256
  syntax on
  set hlsearch
  set background=dark
  colorscheme hybrid
  "colorscheme solarized
  " Variables required to display 256 colors in ConEmu(Windows).
  " Similar options are written in .bashrc in case of mintty.
  if !empty($CONEMUBUILD)
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif
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
set wrap
set textwidth=0
set list " show special characters
if !has('win32') || has('gui_running')
  set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
else
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
set wildignore=*.o,*.obj,*/.git/*,*.pyc,*.ps,*.png,*.jpg,*.eps,*.aux,.DS_Store


" misc
set mouse=a
set backspace=indent,eol,start
"set clipboard+=unnamed
set history=50
set vb t_vb=
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" }}}
" === KEY MAPPINGS === {{{
" move cursor on displayed lines (think wrapped line as a line)
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

" go to normal mode from insert mode with jj
inoremap jj <Esc>

" for ANSI keyboard
nnoremap ; :

" move cursor in insert mode
"inoremap <C-h> <Esc>ha
"inoremap <C-j> <Esc>ja
"inoremap <C-k> <Esc>ka
"inoremap <C-l> <Esc>la

" use <Tab> and <S-Tab> in pop-up menu
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" brackets and quotations
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
" === Abbreviation === {{{
abbreviate etal et al.
" }}}
" === Functions and Commands === {{{
" }}}

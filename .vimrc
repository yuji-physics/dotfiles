".vimrc

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
" PLUGIN SETTING
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

"=============================================================
" NeoBundle
"=============================================================
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
NeoBundle 'Shougo/vimshell'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'matze/vim-tex-fold'
NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"============================================================
" Lightline
"============================================================
"from http://itchyny.hatenablog.com/entry/20130828/1377653592
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
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

"============================================================
" Vim-LaTeX
"============================================================

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

"=============================================================
" Unite
"=============================================================

" let g:unite_winwidth = 40


"=============================================================
" vimfiler
"=============================================================

" let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1

"=============================================================
" Vim-tex-fold
"=============================================================
let g:tex_fold_additional_envs=1


"=============================================================
" Syntastic
"=============================================================
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header=1

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" END OF PLUGIN SETTINGS
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"=============================================================
" Basic settings
"=============================================================
" language
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp932,sjis,euc-jp

" highlight 
if &t_Co > 2 || has("gui_running")
	set t_Co=256
  syntax on
  set hlsearch
endif
set background=dark
"colorscheme solarized
colorscheme hybrid

" show cursorline 
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=236
highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236
set cursorline
set cursorcolumn
set number

"fold
"let javascript_fold=1
"let perl_fold=1
"let php_folding=1
"let r_syntax_folding=1
"let ruby_fold=1
"let sh_fold_enabled=1
"let vimsyn_folding='af'
"let xml_syntax_folding=1
"set foldmethod=syntax
set foldmethod=marker
set foldcolumn=4
set foldlevel=0

" indent
set smartindent
set autoindent
set nocindent

" backup
set noundofile
set noswapfile
set nobackup

" tab
"set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" window style
set showcmd
set cmdheight=2
set laststatus=2
set notitle
set ruler
set splitbelow
set splitright

" text style 
set nowrap
set showmatch

" key
set backspace=indent,eol,start
set history=50

" search, autocomplete
set incsearch
set ignorecase
set wildmenu
set wildmode=full

" mouse
set mouse=a
"=============================================================
" Mapping
"=============================================================
" cursor move
nnoremap j gj
nnoremap k gk
" window size
" <S-up/down/left/right> key bind cannot be used in tmux by default?
"nnoremap <silent> <S-Left> :5wincmd <<CR>
"nnoremap <silent> <S-Right> :5wincmd ><CR>
"nnoremap <silent> <S-Up> :5wincmd +<CR>
"nnoremap <silent> <S-Down> :5wincmd -<CR>
nnoremap <silent> <Left> :5wincmd <<CR>
nnoremap <silent> <Right> :5wincmd ><CR>
nnoremap <silent> <Up> :5wincmd +<CR>
nnoremap <silent> <Down> :5wincmd -<CR>

" search
nnoremap g; g;zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <C-n> :noh<CR>

" Clang completion
nnoremap // I//

nnoremap br A<br><ESC>

" input <Space> <Enter> in normal mode
nnoremap <Space> i<Space><ESC><Right>
nnoremap <Enter> i<CR><ESC>

" insert modeでのカーソル移動
"<C-j>はVimLatexの<++>移動と競合するため、 ~/.vim/plugin/imaps.vimの490行付近を<C-F>に変更
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"括弧、クォートの補完
"括弧 + Enterで改行および括弧補完をし、カーソルを中央へ
"F10 keyで補完のトグルをする（予定）
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ( ()<Left>

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap { {}<Left>

inoremap [ []<Left>

"inoremap < <><Left>

inoremap $$ $$<Left>

inoremap "<Enter> ""<Left><CR><ESC><S-o>
inoremap "" ""<Left>

inoremap '<Enter> ''<Left><CR><ESC><S-o>
inoremap '' ''<Left>

inoremap `<Enter> ``<Left><CR><ESC><S-o>
inoremap `` ``<Left>


"for python
inoremap __ ____<Left><Left>


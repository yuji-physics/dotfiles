if has('nvim')
    colorscheme solarized
    set background=dark
else
    colorscheme NeoSolarized
    set background=dark
endif
syntax on
"set transparency=10
if has('unix')
  set guifont=DejaVu\ Sans\ Mono\ 12
else
  set guifont=Cica:h12
endif
"set imdisable
"English Menu
source $VIMRUNTIME/delmenu.vim
set langmenu=none
set vb t_vb=

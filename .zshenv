#.zshenv
export PATH=/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
export EDITOR=vim
export LS_COLORS='di=04;34:ln=04;36:so=32:pi=33:ex=31:bd=39:cd=39:su=39:sg=39:tw=04;34:ow=04;34'

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# Python
export PYTHONDONTWRITEBYTECODE=1
if [ -e "${HOME}/.pyenv" ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# GO
if [ -e "/usr/local/go" ]; then
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# Tex
if [ -e "/usr/local/tex/" ]; then
  export TEXINPUTS=$TEXINPUTS:/usr/local/tex/sty
  export BSTINPUTS=$BSTINPUTS:/usr/local/tex/bst
  export BIBINPUTS=$BIBINPUTS:/usr/local/tex/bib
fi

# Ranger
if which ranger 2>&1 > /dev/null; then
  export RANGER_LOAD_DEFAULT_RC=FALSE
fi

if [ $(uname -s) = "Darwin" ]; then
  #export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig:/usr/local/lib/pkgconfig"
fi

# Astronomical tools
# GLISH
if [ -e "/usr/local/src/glish" ]; then
  export GLISHROOT="/usr/local/src/glish"
  source /usr/local/src/livedata/init.sh
fi
# Kvis
if [ -e "/usr/local/karma" ]; then
  export KARMABASE="/usr/local/karma"
  export PATH="/usr/local/karma/bin:$PATH"
  alias convert="/usr/local/bin/convert"
fi
# MIRIAD
if [ -e "/usr/local/src/miriad/MIRRC.sh" ]; then
  source /usr/local/src/miriad/MIRRC.sh
fi

export ZDOTDIR=$HOME/.zsh

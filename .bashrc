# do not use C-s for stop display
stty stop undef

# HISTORY
# ignore duplicate commands
#export HISTCONTROL=ignoredups
# ignore commands which begin with "space"
#export HISTCONTROL=ignorespace
# use both ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# set ignore commands
export HISTIGNORE=?:??:???:exit:cd*
# history size in bash
export HISTSIZE=10000
# history size in $HISTFILE
export HISTFILESIZE=10000
# where history is saved
export HISTFILE=~/.bash_history
# show time in history
export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S: '

# shopt
# ON  shopt -s
# OFF shopt -u
#shopt -s autocd # autocd require bash 4.x
shopt -s extglob # expand wildcard

# PROMPT
PS1='\[\e[0;37m\][\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[0;37m\]]\[\e[m\] \[\e[1;36m\]\$\[\e[m\]\[\e[0;37m\]'
export LS_COLORS='di=04;34:ln=04;36:so=01;32:pi=01;33:ex=01;31:bd=01;39:cd=01;39:su=01;39:sg=01;39:tw=04;34:ow=04;34'

# ALIAS
alias ls='ls --show-control-chars --color'
alias la='ls --show-control-chars --color -a'
alias ll='ls --show-control-chars --color -l'

if [ -f $HOME/.bashrc.local ]; then
  source $HOME/.bashrc.local
fi

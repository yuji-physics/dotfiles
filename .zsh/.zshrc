# .zshrc
# Common settings
autoload -U compinit
compinit
setopt correct
setopt nobeep
setopt prompt_subst
setopt ignoreeof
setopt no_tify
setopt hist_ignore_dups
setopt auto_pushd
setopt auto_cd
setopt combining_chars
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#bindkey -v
typeset -U path cdpath fpath manpath
autoload -U promptinit
promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

#----------------------
# PROMPT
#----------------------
PROMPT=""
PROMPT+="[%U%F{blue}%~%f%u] %F{cyan}$%f"
#RPROMPT=""
#RPROMPT+="[%U%D %*%u]"
# title
case "${TERM}" in
xterm*)
precmd() {
echo -ne "\033]0;${PWD}\007"
}
;;
esac

#----------------------
# COLOR
#----------------------
#export LSCOLORS=exfxcxdxfxexexaxaxexex
export LS_COLORS='di=04;34:ln=04;36:so=32:pi=33:ex=31:bd=39:cd=39:su=39:sg=39:tw=04;34:ow=04;34'
# color of auto completion
zstyle ':completion:*' list-colors 'di=04;34' 'ln=04;36' 'so=32' 'ex=31' 'bd=39' 'cd=39' 'su=39' 'sg=39' 'tw=04;34' 'ow=04;34'

# Load settings depend on OS
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

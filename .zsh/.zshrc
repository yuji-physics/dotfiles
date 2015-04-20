#.zshrc
# Common settings
autoload -U compinit
compinit
setopt correct
setopt nobeep
setopt prompt_subst
setopt ignoreeof
setopt no_tify
setopt no_flow_control
#---------------------
# History
#---------------------
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_verify
setopt inc_append_history
setopt EXTENDED_HISTORY
# donot store some commands in history
zshaddhistory(){
local line=${1%%$'\n'}
local cmd=${line%% *}

[[ ${#line} -ge 5
&& ${cmd} != (l|l[sal])
&& ${cmd} != (cd)
&& ${cmd} != (rm)
&& ${cmd} != (exit)
&& ${cmd} != (man)
]]
}

#---------------------

setopt auto_pushd
# exec `cd` with a directory name
setopt auto_cd
setopt combining_chars
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
bindkey -e
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
#PROMPT+="[%U%F{blue}%~%f%u] %F{green}%n:%f%F{cyan}$%f"
PROMPT+="%F{green}@%n%f %F{cyan}$%f"
RPROMPT=""
#RPROMPT+="[%U%D %*%u]"
RPROMPT+="[%U%F{blue}%~%f%u]"
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

#----------------------
# Key bind
#----------------------
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

#----------------------
# Other resources
#----------------------
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
export PATH

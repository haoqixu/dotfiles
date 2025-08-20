HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt alwaystoend
setopt autocd
setopt autopushd
setopt completeinword
setopt extendedhistory
setopt noflowcontrol
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt interactive
setopt interactivecomments
setopt longlistjobs
setopt monitor
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt zle

# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' menu select

# completion based on the prefix of the command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# history
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# movement
bindkey "^B" backward-char
bindkey "^F" forward-char
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# editing
bindkey "^K" kill-line
bindkey "^Y" yank

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

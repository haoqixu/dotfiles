#!/bin/bash
# shellcheck disable=SC1090


# Javascript
# nvm: node version manager
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Ruby
# rvm: ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
appendpath "$HOME/.rvm/bin"


# Rust
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"


# Python
# pyenv: python version manager
export PYTHONSTARTUP="$HOME/dotfiles/python/pythonstartup.py"
if [[ -d "$HOME/.pyenv" ]]; then
    prependpath "$HOME/.pyenv/bin"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv"
fi

# Golang
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

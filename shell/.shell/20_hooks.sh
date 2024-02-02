#!/bin/bash
# shellcheck disable=SC1090


# NodeJS
export NVS_HOME="$HOME/.nvs"
[[ -s "$NVS_HOME/nvs.sh" ]] && . "$NVS_HOME/nvs.sh"
[[ -d "$HOME/.npm-global/bin" ]] && appendpath "$HOME/.npm-global/bin"

export VOLTA_HOME="$HOME/.volta"
prependpath "$VOLTA_HOME/bin"

# Ruby
# rvm: ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
appendpath "$HOME/.rvm/bin"


# Rust
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Go
[[ -d "$HOME/go/bin" ]] && appendpath "$HOME/go/bin"

# Python
# pyenv: python version manager
export PYTHONSTARTUP="$HOME/dotfiles/python/pythonstartup.py"
export PIPENV_VENV_IN_PROJECT=1
if [[ -d "$HOME/.pyenv" ]]; then
    prependpath "$HOME/.pyenv/bin"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv"
fi

# Golang
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# common utils
prependpath "$HOME/bin"

#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load *.sh and *.zsh file from ~/.shell
if [[ -d ~/.shell ]]; then
    for rcfile in ~/.shell/*.{sh,zsh}; do
        # shellcheck source=/dev/null
        [[ -r "$rcfile" ]] && . "$rcfile"
    done
    unset rcfile
fi

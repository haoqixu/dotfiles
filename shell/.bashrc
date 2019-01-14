#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Load *.sh and *.bash file from ~/.shell
if [[ -d ~/.shell ]]; then
    for rcfile in ~/.shell/*.{sh,bash}; do
        # shellcheck source=/dev/null
        [[ -r "$rcfile" ]] && . "$rcfile"
    done
    unset rcfile
fi

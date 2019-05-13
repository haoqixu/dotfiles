#!/usr/bin/env bash

[[ $OSTYPE != darwin* ]] && return

# use GNU coreutils instead of BSD coreutils
prependpath "/usr/local/opt/coreutils/libexec/gnubin"

# disable special creation/extraction of ._* files by tar, etc. on Mac OS X
# ref: https://superuser.com/questions/259703/get-mac-tar-to-stop-putting-filenames-in-tar-archives
# ref: https://superuser.com/questions/61185/why-do-i-get-files-like-foo-in-my-tarball-on-os-x
# ref: https://unix.stackexchange.com/questions/9665/create-tar-archive-of-a-directory-except-for-hidden-files
[[ $OSTYPE == darwin* ]] && export COPYFILE_DISABLE=1

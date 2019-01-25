#!/usr/bin/env bash

[[ $OSTYPE != darwin* ]] && return

# use GNU coreutils instead of BSD coreutils
prependpath "/usr/local/opt/coreutils/libexec/gnubin"

# tar excludes macos ._ files
# ref: https://superuser.com/questions/259703/get-mac-tar-to-stop-putting-filenames-in-tar-archives
# ref: https://superuser.com/questions/61185/why-do-i-get-files-like-foo-in-my-tarball-on-os-x
[[ $OSTYPE == darwin* ]] && export COPYFILE_DISABLE=1

#!/bin/bash

# Append our default paths
# ref: archlinux /etc/profile
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
    export PATH
}

# proxy settings
# ref: https://wiki.archlinux.org/index.php/Proxy_server
proxy_set () {
    noproxy_append "localhost"
    noproxy_append "127.0.0.1"
    noproxy_append "::1"

    if (( $# > 0)); then
        export http_proxy="$1" \
            https_proxy=$http_proxy \
            ftp_proxy=$http_proxy \
            rsync_proxy=$http_proxy \
            HTTP_PROXY=$http_proxy \
            HTTPS_PROXY=$http_proxy \
            FTP_PROXY=$http_proxy \
            RSYNC_PROXY=$http_proxy
        echo "Proxy environment variable set."
        echo "No Proxy: $no_proxy"
        return 0
    fi

    echo "Nothing to do."
}

proxy_unset () {
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo "Proxy environment variable removed."
}

noproxy_append () {
    case ",$no_proxy," in
        *,"$1",*)
            ;;
        *)
            no_proxy="${no_proxy:+$no_proxy,}$1"
    esac
    export no_proxy
    export NO_PROXY=$no_proxy
}

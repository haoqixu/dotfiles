setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
iabbrev <buffer> iff if:<left>

let b:ale_linters = ['flake8']
let b:ale_fixers = ['black']

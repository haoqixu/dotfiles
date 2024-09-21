" vim: set foldmethod=marker foldlevel=0 nomodeline:
"=============================================================================
" Author: xu0o0
" Email: hqcat6@gmail.com
" References:
"	* <https://github.com/amix/vimrc>
"	* <https://github.com/junegunn/dotfiles/blob/master/vimrc>
"=============================================================================

lua require("init")

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Movement
:onoremap p i(

" ============================================================================
"  Status line
" ============================================================================

" ============================================================================
"  Editing mappings
" ============================================================================

" ============================================================================
"  vimgrep searching and cope displaying
" ============================================================================

" ============================================================================
"  Spell checking
" ============================================================================

" ============================================================================
"  Misc
" ============================================================================
"if has('mac')
"    " macOS
"    " let g:python_host_prog = $HOME . '/.virtualenvs/nvim-py2/bin/python'
"    " let g:python3_host_prog = $HOME . '/.virtualenvs/nvim-py3/bin/python'
"    " let g:python3_host_prog = '/usr/bin/python3'
"else
"    " linux
"    let g:python_host_prog = '/usr/bin/python2'
"    let g:python3_host_prog = '/usr/bin/python3'
"    let g:ncm2_jedi#environment = '/usr/bin/python3'
"endif

" ============================================================================
"  Temp
" ============================================================================


set cursorline
set cursorcolumn

set magic

set fileencodings=utf8,cp936,gb18030,big5

set clipboard=unnamed
set clipboard+=unnamedplus
cnoremap <c-n> <down>
cnoremap <c-p> <up>

:autocmd BufNew,BufRead *.html setlocal nowrap

:autocmd BufReadPost quickfix :setlocal norelativenumber number

:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>

:autocmd FileType rst,python     :setlocal et ts=4 sw=4 sts=4
:autocmd FileType javascript,html,css,vue,scheme,jinja :setlocal et ts=2 sw=2 sts=2

" let g:emmet_html5 = 1
" let g:user_emmet_leader_key = '<C-y>'

let g:NERDSpaceDelims = 1

let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'coc',
  \ 'go': 'coc',
  \ }


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> th :CocCommand document.toggleInlayHint<CR>

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" --------------------------------
" ALE
" --------------------------------
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters = {
\   'c': ['clang'],
\   'cpp': ['clang'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\   'proto': ['buf-lint',],
\   'go': [],
\}
let g:ale_fixers = {
\   'proto': ['buf-format'],
\}
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_auto_pipenv = 1

" --------------------------------
" Markdown
" --------------------------------
let g:table_mode_corner='|'
let g:mkdp_path_to_chrome = "firefox"
let g:markdown_enable_spell_checking = 0
let g:markdown_include_jekyll_support = 0
:autocmd FileType markdown :silent TableModeEnable

" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

nmap <leader>ga <Plug>(EasyAlign)
xmap <leader>ga <Plug>(EasyAlign)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Copy from meain/vim-jsontogo
function! s:JsonToGo() range
    let cmd = [
        \ '!gojson',
        \]
    let cmd = add(cmd, '-name ' . expand('%:r'))
    let cmd = add(cmd, '-pkg ' . expand('%:r'))
    execute a:firstline . ',' . a:lastline . join(cmd)
endfunction

augroup jsontogo
    autocmd!
    autocmd FileType go
        \ command! -bar -nargs=0 -buffer -range=% JsonToGo <line1>,<line2>call s:JsonToGo()
augroup end

" Defx {{{
nnoremap <silent> - :<C-u>call <SID>open_defx()<CR>

function! s:open_defx() abort
    let g:defx_icons_enable_syntax_highlight = 0
    call defx#custom#option('_', {
                \ 'columns': 'git:indent:icons:space:filename',
                \ 'buffer_name': 'defx',
                \ 'show_ignored_files': 0,
                \ 'toggle': 0,
                \ 'resume': 1
                \ })
    Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
endfunction

autocmd BufWritePost * call defx#redraw()
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_tree', ['toggle', 'nested'])
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:git:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')

    nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
    nnoremap <buffer><silent> ]c <Plug>(defx-git-next)
    nnoremap <buffer><silent> ]a <Plug>(defx-git-stage)
    nnoremap <buffer><silent> ]r <Plug>(defx-git-reset)
    nnoremap <buffer><silent> ]d <Plug>(defx-git-discard)
endfunction
" }}}

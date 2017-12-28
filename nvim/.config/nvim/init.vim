" vim: set foldmethod=marker foldlevel=0 nomodeline:
"=============================================================================
" Author: xu0o0
" Email: hqcat6@gmail.com
" References:
" 	* <https://github.com/amix/vimrc>
" 	* <https://github.com/junegunn/dotfiles/blob/master/vimrc>
"=============================================================================


" ============================================================================
"  Vim-plug Block {{{
" ============================================================================
call plug#begin('~/.config/nvim/plugged')

" --------------------------------
" General
" --------------------------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'justinmk/vim-gtfo'
Plug 'vim-scripts/fcitx.vim'
Plug 'ianva/vim-youdao-translater'

" --------------------------------
" UI
" --------------------------------
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'junegunn/limelight.vim'
" theme
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-emoji'

" --------------------------------
" Completion
" --------------------------------
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'calebeby/ncm-css'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" --------------------------------
" Lint
" --------------------------------
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" --------------------------------
" Search & Browse
" --------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf'

Plug 'easymotion/vim-easymotion'


" --------------------------------
" Hightlight
" --------------------------------
Plug 'junegunn/rainbow_parentheses.vim'

" --------------------------------
" Editing
" --------------------------------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'

" --------------------------------
" Version Control & Diff
" --------------------------------
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify', { 'on': 'SignifyToggle' }

" --------------------------------
" Language Related
" --------------------------------
" Markdown
Plug 'iamcco/mathjax-support-for-mkdp',		{ 'for': 'markdown' }
"Plug 'MikeCoder/markdown-preview.vim',		{ 'for': 'markdown' }
Plug 'haoqixu/markdown-preview.vim', 		{ 'for': 'markdown' }
Plug 'gabrielelana/vim-markdown', 		{ 'for': 'markdown' }
Plug 'joker1007/vim-markdown-quote-syntax', 	{ 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc', 		{ 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', 		{ 'for': 'markdown' }
Plug 'lvht/tagbar-markdown', 			{ 'for': 'markdown' }

" Python
Plug 'google/yapf', 			{ 'for': 'python' }
Plug 'timothycrosley/isort', 		{ 'for': 'python' }

" Mics
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-scripts/nginx.vim'
Plug 'honza/dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'htm', 'css', 'js', 'vue'] }
Plug 'pangloss/vim-javascript'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'posva/vim-vue'

call plug#end()

" }}}

" ============================================================================
"  Temp
" ============================================================================

" Basic Settings
" FileType-specific Settings
" Mappings
" StatusLine


set noerrorbells
set novisualbell
set t_vb=

set clipboard=unnamed
cnoremap <c-n> <down>
cnoremap <c-p> <up>

:autocmd BufNew,BufRead *.html setlocal nowrap

:autocmd BufReadPost quickfix :setlocal norelativenumber number

:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>

:autocmd FileType python     :setlocal et ts=4 sw=4 sts=4
:autocmd FileType javascript,html,css,vue,scheme :setlocal et ts=2 sw=2 sts=2

" Movement
:onoremap p i(

" --------------------------------
" ALE
" --------------------------------
let g:ale_linters = {
\	'c': ['clang'],
\	'cpp': ['clang']
\}

" --------------------------------
" Markdown
" --------------------------------
let g:table_mode_corner='|'
let g:mkdp_path_to_chrome = "firefox"
let g:markdown_enable_spell_checking = 0
let g:markdown_include_jekyll_support = 0
:autocmd FileType markdown :silent TableModeEnable


" --------------------------------
" goyo.vim + limelight.vim
" --------------------------------
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" ============================================================================
"  General
" ============================================================================
set history=1000
set mouse=a

filetype plugin indent on

set autoread
let mapleader = " "
let g:mapleader = " "

nnoremap <leader>G :Goyo<CR>

" ============================================================================
"  Ui
" ============================================================================
set ruler
set relativenumber
set cmdheight=2

set ignorecase
set smartcase
set hlsearch
set incsearch
set noshowmode

set cursorline
set cursorcolumn

set lazyredraw

set magic

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" ============================================================================
"  Colors and Fonts
" ============================================================================
colorscheme gruvbox
set background=dark

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set encoding=utf8
set ffs=unix,dos,mac

" ============================================================================
"  Files, Backups and Undo
" ============================================================================

" ============================================================================
"  Text, Tab and Indent related
" ============================================================================
"
"



:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

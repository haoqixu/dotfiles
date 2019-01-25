" vim: set foldmethod=marker foldlevel=0 nomodeline:
"=============================================================================
" Author: xu0o0
" Email: hqcat6@gmail.com
" References:
"	* <https://github.com/amix/vimrc>
"	* <https://github.com/junegunn/dotfiles/blob/master/vimrc>
"=============================================================================


" ============================================================================
"  Vim-plug Block {{{
" ============================================================================
call plug#begin('~/.config/nvim/plugged')

" --------------------------------
" General
" --------------------------------
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'ianva/vim-youdao-translater'
"Plug 'justinmk/vim-gtfo'

if has('mac')
  Plug 'CodeFalling/fcitx-vim-osx'
else
  Plug 'vim-scripts/fcitx.vim'
endif

" --------------------------------
" UI
" --------------------------------
Plug 'itchyny/lightline.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'amix/vim-zenroom2'
"Plug 'junegunn/limelight.vim'

" theme
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'junegunn/vim-emoji'

" --------------------------------
" Completion
" --------------------------------

" Requires vim8 with has('python') or has('python3')
" Requires the installation of msgpack-python. (pip install msgpack-python)
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-ultisnips'
"Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/ncm-clang'
"Plug 'calebeby/ncm-css'

" --------------------------------
" Lint & formater
" --------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
"Plug 'junegunn/vim-easy-align'
"Plug 'scrooloose/syntastic'

" --------------------------------
" Search & Browse
" --------------------------------
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'Shougo/denite.nvim'

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
"Plug 'junegunn/gv.vim' 'gregsexton/gitv'
Plug 'mhinz/vim-signify', { 'on': 'SignifyToggle' }

" --------------------------------
" Language Related
" --------------------------------
" Markdown
Plug 'iamcco/mathjax-support-for-mkdp',		{ 'for': 'markdown' }
Plug 'MikeCoder/markdown-preview.vim',		{ 'for': 'markdown' }
Plug 'gabrielelana/vim-markdown',		{ 'for': 'markdown' }
Plug 'joker1007/vim-markdown-quote-syntax',	{ 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc',		{ 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode',		{ 'for': 'markdown' }
Plug 'lvht/tagbar-markdown',			{ 'for': 'markdown' }

" Python
Plug 'google/yapf',			{ 'for': 'python' }
Plug 'timothycrosley/isort',		{ 'for': 'python' }

" Mics
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-scripts/nginx.vim'
Plug 'honza/dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'htm', 'css', 'js', 'vue', 'jinja', 'jinja.html'] }
Plug 'pangloss/vim-javascript'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'posva/vim-vue'

call plug#end()

" }}}



" ============================================================================
"  General
" ============================================================================
" Enable non-compatible with Vi.
set nocompatible

" Sets how many lines of history VIM has to remember
set history=1000

" Enable the use of mouse
set mouse=a

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = " "
let g:mapleader = " "

" Toggle paste mode on and off
set pastetoggle=<leader>p

" Fast saving
nnoremap <leader>w :w!<cr>

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" ============================================================================
"  UI
" ============================================================================
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"scrolloff

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set number
set relativenumber

" ============================================================================
"  Colors and Fonts
" ============================================================================
colorscheme gruvbox
set background=dark

" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
" Use Unix as the standard file type
set encoding=utf8
set ffs=unix,dos,mac

" ============================================================================
"  Files, Backups and Undo
" ============================================================================

" ============================================================================
"  Text, Tab and Indent related
" ============================================================================
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=4
set tabstop=8
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" ============================================================================
"  Moving around, tabs, windows and buffers
" ============================================================================
" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

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
let g:python_host_prog = $HOME . '/.virtualenvs/nvim-py2/bin/python'
let g:python3_host_prog = $HOME . '/.virtualenvs/nvim-py3/bin/python'

" ============================================================================
"  Temp
" ============================================================================


set cursorline
set cursorcolumn

set magic

set fileencodings=utf8,cp936,gb18030,big5

set clipboard=unnamed
cnoremap <c-n> <down>
cnoremap <c-p> <up>

:autocmd BufNew,BufRead *.html setlocal nowrap

:autocmd BufReadPost quickfix :setlocal norelativenumber number

:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>

:autocmd FileType rst,python     :setlocal et ts=4 sw=4 sts=4
:autocmd FileType javascript,html,css,vue,scheme,jinja :setlocal et ts=2 sw=2 sts=2

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:emmet_html5 = 1
let g:user_emmet_leader_key = '<C-y>'

let g:NERDSpaceDelims = 1

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

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

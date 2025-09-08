return {
  --Plug "majutsushi/tagbar", { "on": "TagbarToggle" }

  { "mbbill/undotree",   cmd = "UndotreeToggle" },
  --[[
  {
    "Yggdroot/indentLine",
    config = function()
      vim.g.indentLine_setConceal = 0
    end
  },
  ]] --

  -- --------------------------------
  -- UI
  -- --------------------------------
  --"itchyny/lightline.vim",
  --Plug "junegunn/goyo.vim"
  --Plug "amix/vim-zenroom2"
  --Plug "junegunn/limelight.vim"

  -- theme
  --Plug "tomasr/molokai"
  --Plug "rakr/vim-one"
  --Plug "morhetz/gruvbox"
  --Plug "ellisonleao/gruvbox.nvim"
  {
    "gruvbox-community/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end

  },
  "junegunn/vim-emoji",
  "ryanoasis/vim-devicons",
  "kristijanhusak/defx-icons",
  "kristijanhusak/defx-git",

  -- --------------------------------
  -- Completion
  -- --------------------------------

  -- Requires vim8 with has("python") or has("python3")
  -- Requires the installation of msgpack-python. (pip install msgpack-python)
  {
    "SirVer/ultisnips",
    dependencies = {
      "honza/vim-snippets",
    },
  },
  -- Plug "github/copilot.vim"


  -- --------------------------------
  -- Lint & formater
  -- --------------------------------
  "editorconfig/editorconfig-vim",
  "bufbuild/vim-buf",
  {
    "psf/black",
    branch = "stable"
  },
  --Plug "janko/vim-test"

  -- --------------------------------
  -- Search & Browse
  -- --------------------------------
  {
    "junegunn/fzf.vim",
    dependencies = {
      { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
    },
  },
  -- Plug "dyng/ctrlsf.vim"
  -- Plug "ctrlpvim/ctrlp.vim"
  -- Plug "Shougo/denite.nvim"

  "easymotion/vim-easymotion",
  --Plug "jsfaint/gen_tags.vim"
  --Plug "ludovicchabant/vim-gutentags"


  -- --------------------------------
  -- Hightlight
  -- --------------------------------
  "junegunn/rainbow_parentheses.vim",

  -- --------------------------------
  -- Editing
  -- --------------------------------
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-speeddating",
  "tpope/vim-abolish",
  "terryma/vim-multiple-cursors",
  "terryma/vim-expand-region",

  -- --------------------------------
  -- Version Control & Diff
  -- --------------------------------
  "tpope/vim-fugitive",
  "tpope/vim-git",
  "christoomey/vim-conflicted",
  "junegunn/gv.vim",
  "mhinz/vim-signify",

  -- --------------------------------
  -- Language Related
  -- --------------------------------
  -- Markdown
  { "iamcco/markdown-preview.nvim",        build = "cd app & yarn install", ft = "markdown" },
  --Plug "gabrielelana/vim-markdown",		{ "for": "markdown" }
  { "joker1007/vim-markdown-quote-syntax", ft = "markdown" },
  { "mzlogin/vim-markdown-toc",            ft = "markdown" },
  { "dhruvasagar/vim-table-mode",          ft = "markdown" },
  { "lvht/tagbar-markdown",                ft = "markdown" },

  "saltstack/salt-vim",
  "tpope/vim-scriptease",

  -- Plug "Lervag/vimtex"
  "cespare/vim-toml",

  -- Python
  --Plug "google/yapf",			{ "for": "python" }
  --Plug "timothycrosley/isort",		{ "for": "python" }

  -- Mics
  { "fatih/vim-go",                     build = ":GoUpdateBinaries" },
  "AndrewRadev/splitjoin.vim",
  "vim-scripts/nginx.vim",
  "honza/dockerfile.vim",
  { "octol/vim-cpp-enhanced-highlight", ft = "cpp" },
  -- Plug "mattn/emmet-vim", { "for": ["html", "htm", "css", "javascript", "vue", "jinja", "jinja.html", "javascriptreact", "typescriptreact", "typescript"] }
  "pangloss/vim-javascript",
  --Plug "chemzqm/vim-jsx-improve"
  "MaxMEllon/vim-jsx-pretty",
  "leafgarland/typescript-vim",
  "peitalin/vim-jsx-typescript",
  "Glench/Vim-Jinja2-Syntax",
  "hail2u/vim-css3-syntax",
  "ap/vim-css-color",
  "posva/vim-vue",
  "nathangrigg/vim-beancount",

  -- Plug "vim-scripts/drawit", { "on": "DrawIt" }
  "jbyuki/venn.nvim",
}

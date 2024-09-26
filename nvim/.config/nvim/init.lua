vim.g.mapleader = " "

-- bootstrap lazy.nvim
require("bootstrap")

-- Sets how many lines of history VIM has to remember
vim.opt.history = 1000

-- Enable the use of mouse
vim.opt.mouse = "a"

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true

-- Fast saving
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")

vim.keymap.set("n", "<leader>f", "<cmd>FZF<cr>")
vim.keymap.set("n", "<leader>ev", "<cmd>vsplit $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>")

-- ============================================================================
--  UI
-- ============================================================================
-- Set 7 lines to the cursor - when moving vertically using j/k
vim.opt.so = 7
--scrolloff

-- Turn on the WiLd menu
vim.opt.wildmenu = true

-- Ignore compiled files
vim.opt.wildignore = { "*.o", "*~", "*.pyc" }

--Always show current position
vim.opt.ruler = true

-- Height of the command bar
vim.opt.cmdheight = 2

-- A buffer becomes hidden when it is abandoned
vim.opt.hid = true

-- Configure backspace so it acts as it should act
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  h = true,
  l = true,
}

-- Ignore case when searching
vim.opt.ignorecase = true

-- When searching try to be smart about cases
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true
-- How many tenths of a second to blink when matching brackets
vim.opt.mat = 2

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.tm = 500

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "quickfix",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end
})

-- ============================================================================
--  Colors and Fonts
-- ============================================================================

-- Set utf8 as standard encoding and en_US as the standard language
-- Use Unix as the standard file type
vim.opt.encoding = "utf8"
vim.opt.ffs = { "unix", "dos", "mac" }

-- ============================================================================
--  Files, Backups and Undo
-- ============================================================================

-- ============================================================================
--  Text, Tab and Indent related
-- ============================================================================
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Be smart when using tabs ;)
vim.opt.smarttab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.softtabstop = 4

-- Linebreak on 500 characters
vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.ai = true   -- Auto indent
vim.opt.si = true   -- Smart indent
vim.opt.wrap = true -- Wrap lines

vim.opt.listchars = {
  tab = "→ ",
  space = "·",
  nbsp = "␣",
  trail = "•",
  eol = "¶",
  precedes = "«",
  extends = "»",
}


-- ============================================================================
--  Moving around, tabs, windows and buffers
-- ============================================================================
-- Smart way to move between windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")


if vim.fn.has("linux") ~= 0 then
  vim.g.python_host_prog = '/usr/bin/python2'
  vim.g.python3_host_prog = '/usr/bin/python3'
end

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.magic = true

vim.o.fileencodings = "utf8,cp936,gb18030,big5"

vim.o.clipboard = "unnamed,unnamedplus"
vim.keymap.set("c", "<c-n>", "<down>")
vim.keymap.set("c", "<c-p>", "<up>")

-- Return to last edit position when opening files
-- vim.api.nvim_create_autocmd('BufRead', {
--   callback = function(opts)
--     vim.api.nvim_create_autocmd('BufWinEnter', {
--       once = true,
--       buffer = opts.buf,
--       callback = function()
--         local ft = vim.bo[opts.buf].filetype
--         local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
--         if
--           not (ft:match('commit') and ft:match('rebase'))
--           and last_known_line > 1
--           and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
--         then
--           vim.api.nvim_feedkeys([[g`"]], 'nx', false)
--         end
--       end,
--     })
--   end,
-- })
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

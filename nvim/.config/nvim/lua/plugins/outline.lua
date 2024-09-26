return {
  {
    "liuchengxu/vista.vim", -- Viewer & Finder for LSP symbols and tags in Vim
    config = function()
      vim.g.vista_default_executive = 'ctags'
      vim.g.vista_executive_for = {
        cpp = 'coc',
        go = 'coc',
      }
    end
  },
}

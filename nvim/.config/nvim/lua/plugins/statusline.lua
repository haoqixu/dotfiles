vim.opt.laststatus = 2

return {
  {
    "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = {
        colorscheme = 'wombat',
        active = {
          left = { { 'mode', 'paste' },
            { 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' } },
          right = { { 'lineinfo', 'offset' }, { 'percent' }, { 'fileformat', 'fileencoding', 'filetype' } }
        },
        inactive = {
          left = { { 'filename' } },
          right = { { 'lineinfo', 'offset' }, { 'percent' } }
        },
        component_function = {
          gitbranch = 'FugitiveHead',
          cocstatus = 'coc#status',
        },
        component = {
          offset = '%o',
        }
      }
    end
  },
}

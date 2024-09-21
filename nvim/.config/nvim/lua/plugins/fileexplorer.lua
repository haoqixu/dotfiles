return {
  {
    "Shougo/defx.nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.keymap.set("n", "-", function()
        vim.g.defx_icons_enable_syntax_highlight = 0
        vim.fn["defx#custom#option"]("_", {
          columns = 'git:indent:icons:space:filename',
          buffer_name = 'defx',
          show_ignored_files = 0,
          toggle = 0,
          resume = 1,
        })
        vim.cmd("Defx `expand('%:p:h')` -search=`expand('%:p')`")
      end, { silent = true })

      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function() vim.fn["defx#redraw"]() end,
      })

      -- Define mappings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "defx",
        callback = function()
          vim.keymap.set("n", "<CR>", "defx#do_action('open')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "c", "defx#do_action('copy')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "m", "defx#do_action('move')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "p", "defx#do_action('paste')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "l", "defx#do_action('open')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "E", "defx#do_action('open', 'vsplit')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "P", "defx#do_action('preview')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "o", "defx#do_action('open_tree', ['toggle', 'nested'])",
            { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "K", "defx#do_action('new_directory')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "N", "defx#do_action('new_file')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "M", "defx#do_action('new_multiple_files')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "C", "defx#do_action('toggle_columns', 'mark:git:indent:icon:filename:type:size:time')",
            { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "S", "defx#do_action('toggle_sort', 'time')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "d", "defx#do_action('remove')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "r", "defx#do_action('rename')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "!", "defx#do_action('execute_command')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "x", "defx#do_action('execute_system')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "yy", "defx#do_action('yank_path')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", ".", "defx#do_action('toggle_ignored_files')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", ";", "defx#do_action('repeat')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "h", "defx#do_action('cd', ['..'])", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "~", "defx#do_action('cd')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "q", "defx#do_action('quit')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "<Space>", "defx#do_action('toggle_select')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "*", "defx#do_action('toggle_select_all')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "j", "line('.') == line('$') ? 'gg' : 'j'", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "k", "line('.') == 1 ? 'G' : 'k'", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "<C-l>", "defx#do_action('redraw')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "<C-g>", "defx#do_action('print')", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "cd", "defx#do_action('change_vim_cwd')", { silent = true, buffer = true, expr = true })

          vim.keymap.set("n", "[c", "<Plug>(defx-git-prev)", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "]c", "<Plug>(defx-git-next)", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "]a", "<Plug>(defx-git-stage)", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "]r", "<Plug>(defx-git-reset)", { silent = true, buffer = true, expr = true })
          vim.keymap.set("n", "]d", "<Plug>(defx-git-discard)", { silent = true, buffer = true, expr = true })
        end,
      })
    end
  },
}

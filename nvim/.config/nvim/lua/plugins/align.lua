return {
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.keymap.set("n", "<leader>ga", "<Plug>(EasyAlign)")
      vim.keymap.set("x", "<leader>ga", "<Plug>(EasyAlign)")
    end
  },
}

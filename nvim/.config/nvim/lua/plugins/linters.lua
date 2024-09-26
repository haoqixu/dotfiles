return {
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_disable_lsp = 1
      vim.g.ale_fix_on_save = 0
      vim.g.ale_javascript_prettier_use_local_config = 1
      vim.g.ale_linters = {
        c = { 'clang' },
        cpp = { 'clang' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        proto = { 'buf-lint' },
        go = {},
      }
      vim.g.ale_fixers = {
        proto = { 'buf-format' },
      }
      vim.g.ale_use_neovim_diagnostics_api = 1
      vim.g.ale_go_golangci_lint_package = 1
      vim.g.ale_python_auto_pipenv = 1
      vim.g.ale_python_flake8_auto_pipenv = 1
    end
  },
}

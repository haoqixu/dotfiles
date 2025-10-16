return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local function lsp_keymap(bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          lsp_keymap(ev.buf)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          -- Auto-format ("lint") on save.
          -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
          if not client:supports_method('textDocument/willSaveWaitUntil')
              and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = ev.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.diagnostic.config({
        virtual_lines = { current_line = true },
        virtual_text = true,
        underline = true,
        signs = true,
      })

      vim.lsp.config('rust_analyzer', {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              enable = true,
            },
            check = {
              command = "clippy",
            },
            imports = {
              group = {
                enable = false,
              },
            },
            completion = {
              postfix = {
                enable = false,
              },
              autoimport = {
                enable = true,
              },
            },
          },
        },
      })
      vim.lsp.enable('rust_analyzer')

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
      vim.lsp.enable("gopls")

      vim.lsp.enable("ruff")
      vim.lsp.enable("clangd")
      vim.lsp.enable("buf_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("cssls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("zls")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("cue")

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      -- Get signatures (and _only_ signatures) when in argument lists.
      require "lsp_signature".setup({
        doc_lines = 0,
        handler_opts = {
          border = "none"
        },
      })
    end
  },
}

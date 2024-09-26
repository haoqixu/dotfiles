return {
  {
    "neoclide/coc.nvim",

    branch = "release",
    config = function()
      -- Use `[g` and `]g` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

      -- GoTo code navigation.
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

      vim.keymap.set("n", "th", "<cmd>CocCommand document.toggleInlayHint<CR>", { silent = true })

      -- Formatting selected code.
      vim.keymap.set("x", "<leader>cf", "<Plug>(coc-format-selected)")
      vim.keymap.set("n", "<leader>cf", "<Plug>(coc-format-selected)")

      -- Symbol renaming.
      vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")


      -- Applying code actions to the selected code block
      -- Example: `<leader>aap` for current paragraph
      vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)")
      vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)")

      -- Remap keys for applying code actions at the cursor position
      vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)")
      -- Remap keys for apply code actions affect whole buffer
      vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)")
      -- Apply the most preferred quickfix action to fix diagnostic on the current line
      vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)")

      -- Remap keys for applying refactor code actions
      vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
      vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
      vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

      -- Add `:Format` command to format current buffer
      vim.api.nvim_create_user_command("Format", function()
        vim.fn.CocActionAsync("format")
      end, { nargs = 0 })

      vim.api.nvim_create_user_command("Prettier", function()
        vim.fn.CocAction("runCommand", "prettier.formatFile")
      end, { nargs = 0 })

      -- Highlight the symbol and its references when holding the cursor
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.fn.CocActionAsync("highlight")
        end
      })

      -- Use K to show documentation in preview window.
      vim.keymap.set("n", "K", function()
        if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
          vim.cmd("h " .. vim.fn.expand("<cword>"))
        elseif vim.fn["coc#rpc#ready"]() then
          vim.fn.CocActionAsync("doHover")
        else
          vim.cmd("!" .. vim.bo.keywordprg .. " " .. vim.expand("<cword>"))
        end
      end, { silent = true })
    end
  },
}

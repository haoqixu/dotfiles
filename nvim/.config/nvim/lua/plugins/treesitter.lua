return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "terraform",
        "hcl",
        "tsx",
        "typescript",
        "rust",
        "cue",
        "rego",
        "java",
        "proto",
        "yaml",
        "graphql",
        "promql",
        "python",
        "toml",
        "zig",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      indent = { enable = true },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}

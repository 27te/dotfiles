return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "astro-language-server",
        "jdtls",
        "black",
        "python-lsp-server",
        "pyright",
        "tailwindcss-language-server",
        "bash-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "emmet-language-server",
        "stylelint",
        "intelephense",
        "clangd",
        "marksman",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "astro",
        "bash",
        "php",
        "tsx",
        "typescript",
        "javascript",
        "java",
        "php",
        "cpp",
        "c",
        "markdown",
        "markdown_inline",
        "scss",
        "json",
        "rust",
        "pug",
        "toml",
        "yaml",
        "sql",
        "regex",
        "python",
      },
    },
  },
}

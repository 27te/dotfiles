-- lua/plugins/init.lua

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
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
        "tsserver",
        "rust-analyzer",
        "intelephense",
        "jdtls",
        "pyright",
        "black",
        "flake8",
        "bash-language-server",
        "astro-language-server",
        "marksman",
        "tailwindcss-language-server", -- Asegúrate de que esté aquí
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
        "javascript",
        "typescript",
        "rust",
        "php",
        "java",
        "bash",
        "astro",
        "tsx",
        "python",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
    },
    run = ":TSUpdate",
  },
}

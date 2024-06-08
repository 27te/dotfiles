-- lua/configs/treesitter.lua

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "astro",
    "javascript",
    "typescript",
    "html",
    "rust",
    "php",
    "java",
    "bash",
    "tsx",
    "python",
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
  },
}

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
  },
  highlight = {
    enable = true,
  },
}

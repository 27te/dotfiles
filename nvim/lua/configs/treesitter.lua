-- lua/configs/treesitter.lua

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "astro",
    "tsx",
    "typescript",
    "javascript",
    "java",
    "php",
    "c",
    "cpp",
    "json",
    "markdown",
    "mdx",
    "lua",
    "rust",
    "bash",
    "powershell",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

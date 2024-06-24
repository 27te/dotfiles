-- lua/configs/mason.lua
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "tsserver",
    "pyright",
    "rust_analyzer",
    "bashls",
    "clangd",
    "html",
    "cssls",
    "tailwindcss",
    "jsonls",
    "lua_ls",
    "intelephense",
    "jdtls",
    "astro",
    "powershell_es",
  },
}

require("mason-null-ls").setup {
  ensure_installed = {
    "prettier",
    "black",
    "rustfmt",
    "phpcsfixer",
    "shfmt",
    "stylua",
  },
  automatic_installation = true,
}

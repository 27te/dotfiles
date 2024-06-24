-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "astro",
  "tsserver",
  "lua_ls",
  "bashls",
  "intelephense",
  -- "typescript",
  "eslint",
  "java_language_server",
  "clangd",
  "pyright",
  "rust_analyzer",
  "jsonls",
  "sqlls",
  "tailwindcss",
  "vimls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

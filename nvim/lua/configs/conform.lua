-- lua/configs/conform.lua

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    astro = { "prettier-plugin-astro" },
    rust = { "rustfmt" },
    php = { "phpcsfixer" },
    java = { "google-java-format" },
    bash = { "shfmt" },
    python = { "black" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)

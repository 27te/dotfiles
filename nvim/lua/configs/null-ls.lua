-- lua/configs/null-ls.lua

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { "html", "json", "yaml", "markdown", "mdx" }
        })
    },
    on_attach = function(client, bufnr)
        local buf_map = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }
        buf_map(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end,
})


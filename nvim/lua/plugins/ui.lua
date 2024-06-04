return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    config = function()
      require("neo-tree").setup({
        source_selector = {
          winbar = true, -- toggle to show selector on winbar
          statusline = true, -- toggle to show selector on statusline
          show_scrolled_off_parent_node = false, -- boolean
          sources = { -- table
            {
              source = "filesystem", -- string
              display_name = " 󰉓 ", -- string | nil
            },
            {
              source = "buffers", -- string
              display_name = " 󰈚 ", -- string | nil
            },
            {
              source = "git_status", -- string
              display_name = " 󰊢 ", -- string | nil
            },
          },
          tabs_min_width = nil,
          tabs_max_width = nil,
        },
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            default = "󰈚",
            folder_symlink = "",
            custom = {
              ["lnk"] = "",
            },
          },
          git_status = {
            symbols = {
              added = "✚",
              modified = "",
              deleted = "✖",
              renamed = "",
              untracked = "",
              ignored = "",
              unstaged = "✗",
              staged = "✓",
              conflict = "",
            },
          },
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            always_show = {
              ".gitignored",
              ".vscode",
            },
            hide_by_name = {
              ".DS_Store",
              "thumbs.db",
              "node_modules",
            },
          },
        },
        nesting_rules = {
          ["package.json"] = {
            pattern = "^package%.json$", -- <-- Lua pattern
            files = { "package-lock.json", "yarn*" }, -- <-- glob pattern
          },
          ["go"] = {
            pattern = "(.*)%.go$", -- <-- Lua pattern with capture
            files = { "%1_test.go" }, -- <-- glob pattern with capture
          },
          ["js-extended"] = {
            pattern = "(.+)%.js$",
            files = { "%1.js.map", "%1.min.js", "%1.d.ts" },
          },
          ["docker"] = {
            pattern = "^dockerfile$",
            ignore_case = true,
            files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
          },
        },
        window = {
          position = "left",
          width = 25,
          mappings = {
            ["<CR>"] = "open",
            ["<2-LeftMouse>"] = "open",
          },
        },
      })
    end,
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        indicator = {
          style = "underline",
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
      },
    },
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = bubbles_theme,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = { "filename", "branch" },
          lualine_c = {
            "%=", --[[ add your center compoentnts here in place of this comment ]]
          },
          lualine_x = {},
          lualine_y = {
            "filetype",
            "progress",
          },
          lualine_z = {
            {
              "location",
              separator = { right = "" },
              left_padding = 2,
            },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.blue500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.blue500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 2, horizontal = 2 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = white }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                               ▄ ▄
             ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄
             █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
          ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
        ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
        █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
      ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
      █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
          █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
      ]]

      logo = string.rep("\n", 2) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}

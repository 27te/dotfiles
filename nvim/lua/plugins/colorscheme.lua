return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
  -- onedarkpro
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        plugins = {
          neo_tree = false,
        },
        options = {
          cursorline = true,
          transparency = false,
          lualine_transparency = true,
          highlight_inactive_windows = true,
        },
      })
    end,
  },
}

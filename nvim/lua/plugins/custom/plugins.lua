return {
  -- Otros plugins aquí (si tienes alguno)

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        filetypes = { "*" },
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true,
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
      })
    end,
  },
}

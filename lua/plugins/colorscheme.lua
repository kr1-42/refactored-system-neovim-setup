-- Active theme: kanagawa. The others are lazy-loaded; `:colorscheme nord` etc. still works.
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,          -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "dragon",            -- ignored while `background` below maps dark -> wave
        background = {               -- map the value of 'background' option to a theme
          dark = "wave",             -- try "dragon" !
          light = "lotus",
        },
      })
      vim.cmd("colorscheme kanagawa")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
  },

  {
    "gbprod/nord.nvim",
    lazy = true,
    opts = {
      transparent = true,         -- Enable this to disable setting the background color
      terminal_colors = true,     -- Configure the colors used when opening a `:terminal` in Neovim
      diff = { mode = "bg" },     -- values : [bg|fg]
      borders = true,             -- Enable the border between verticaly split windows visible
      errors = { mode = "bg" },   -- values : [bg|fg|none]
      search = { theme = "vim" }, -- values : [vim|vscode]
      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        bufferline = {
          current = {},
          modified = { italic = true },
        },
        lualine_bold = false,
      },
      colorblind = {
        enable = false,
        preserve_background = false,
        severity = { protan = 0.0, deutan = 0.0, tritan = 0.0 },
      },
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors) end,
    },
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    opts = {
      variant = "default",
      transparent = true,
      saturation = 1,
      italic_comments = false,
      hide_fillchars = false,
      borderless_pickers = true,
      terminal_colors = true,
      cache = false,
      highlights = {
        Comment = { fg = "#696969", bg = "NONE", italic = true },
      },
      overrides = function(colors)
        return {
          Comment       = { fg = colors.green, bg = "NONE", italic = true },
          ["@property"] = { fg = colors.magenta, bold = true },
        }
      end,
      colors = {
        bg    = "#000000",
        green = "#00ff00",
        dark  = { magenta = "#ff00ff", fg = "#eeeeee" },
        light = { red = "#ff5c57", cyan = "#5ef1ff" },
      },
      extensions = { telescope = true, notify = true, mini = true },
    },
  },

  { "savq/melange-nvim", lazy = true },
}

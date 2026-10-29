return {
  -- Git signs in the gutter (also feeds lualine's diff component)
  { "lewis6991/gitsigns.nvim", event = "VeryLazy", opts = {} },

  -- Statusline with the open buffers ("tabs") along the bottom
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",                       -- follows the active colorscheme
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        globalstatus = true,                  -- one bar for the whole window layout
        refresh = { statusline = 200 },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "buffers",
            mode = 0,                         -- names only
            show_filename_only = true,
            hide_filetypes = { "NvimTree", "dashboard" },
            symbols = { modified = " ●", alternate_file = "", directory = "" },
            max_length = function() return vim.o.columns * 0.6 end,
          },
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { width = 32 },
      renderer = { group_empty = true, indent_markers = { enable = true } },
      filters = { dotfiles = false },
      git = { enable = true },
      diagnostics = { enable = true },
    },
  },

  -- Highlight word under cursor
  {
    "sontungexpt/stcursorword",
    event = "VeryLazy",
    opts = {
      max_word_length = 100,
      min_word_length = 2,
      excluded = {
        filetypes = { "TelescopePrompt" },
        buftypes = {},
        patterns = {},
      },
      highlight = { underline = true, fg = nil, bg = nil },
    },
  },
}

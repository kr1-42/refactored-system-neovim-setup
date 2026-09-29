return {
  -- Tabline
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
      tabpages = true,
    },
    version = "^1.9.1",
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "nord",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        always_divide_middle = true,
        always_show_tabline  = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline   = 1000,
          winbar    = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            "WinEnter", "BufEnter", "BufWritePost",
            "SessionLoadPost", "FileChangedShellPost",
            "VimResized", "Filetype", "CursorMoved",
            "CursorMovedI", "ModeChanged",
          },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- File tree
  { "nvim-tree/nvim-tree.lua", config = true },

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

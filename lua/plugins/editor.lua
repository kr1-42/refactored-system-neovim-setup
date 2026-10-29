return {
  -- Syntax & indentation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },

  -- Autocomplete (installed, not configured yet)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Terminal integration
  { "luxvim/nvim-luxterm" },

  -- Movement practice game (:VimBeGood)
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
    keys = { { "<leader>G", "<Cmd>VimBeGood<CR>", desc = "Vim practice game" } },
  },

  -- Multiple cursors
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

      { "<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Add cursors to the lines of the visual area" },

      -- Moved from <Leader>a / <Leader>A, which is now the Claude Code prefix
      { "<Leader>c", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
      { "<Leader>C", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = { "n", "x" }, desc = "Add cursors to cword in previous area" },

      { "<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor and jump to next cword" },
      { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

      { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
    },
  },
}

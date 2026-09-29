-- Leader must be set before lazy.nvim loads, or plugin <leader> keys bind to "\"
vim.g.mapleader = " "

require("config.options")
require("config.lazy")     -- plugins live in lua/plugins/*.lua
require("config.keymaps")
require("config.runners")  -- F5–F8 compile / norminette / valgrind
require("config.autocmds")

-- plugin/*.vim (stdheader, gdb, rmautologin) are sourced automatically by Neovim

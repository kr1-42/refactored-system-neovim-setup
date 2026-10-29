-- macOS-only overrides, loaded from init.lua when vim.fn.has("mac") == 1

local runners = require("config.runners")

-- valgrind does not work on current macOS: use AddressSanitizer (+ LeakSanitizer where supported)
runners.run_cmds.c   = "!cc  *.c -g -fsanitize=address -o a.out && ./a.out"
runners.run_cmds.html = "!open %"
runners.leak_cmd     = "!leaks --atExit -- ./a.out"

-- Homebrew (Apple Silicon and Intel) on PATH for tools launched from Neovim
for _, dir in ipairs({ "/opt/homebrew/bin", "/usr/local/bin" }) do
  if not vim.env.PATH:find(dir, 1, true) then
    vim.env.PATH = dir .. ":" .. vim.env.PATH
  end
end

-- Use the system clipboard (pbcopy/pbpaste)
vim.opt.clipboard = "unnamedplus"

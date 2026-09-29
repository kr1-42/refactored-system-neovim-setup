local M = {}

local run_cmds = {
  c      = "!gcc  *.c -o a.out && valgrind --leak-check=full -s ./a.out",
  cpp    = "!g++ % -o %< && time ./%<",
  java   = "!javac % && time java %",
  sh     = "!time bash %",
  python = "!time python3 %",
  html   = "!google-kanagawa",
  go     = "!go build %< && time go run %",
  matlab = "!time octave %",
}

-- Compile & Run (F5)
function M.compile_run()
  vim.cmd("write")
  local cmd = run_cmds[vim.bo.filetype]
  if cmd then
    vim.cmd(cmd)
  end
end

-- write + make + open main.c + compile_run (F7)
function M.wmake()
  vim.cmd("write")
  vim.cmd("make")
  if vim.fn.filereadable("main.c") == 1 then
    vim.cmd("e main.c")
  end
  M.compile_run()
end

-- Check norm (F6)
function M.normcheck()
  vim.cmd("write")
  vim.cmd("!norminette %")
end

-- Valgrind (F8)
function M.valgrind()
  vim.cmd("write")
  vim.cmd("!valgrind --leak-check=full -s ./a.out")
end

local function bind(key, name, modes)
  vim.keymap.set("n", key, M[name])
  vim.keymap.set(modes, key, "<Esc><Cmd>lua require('config.runners')." .. name .. "()<CR>")
end

bind("<F5>", "compile_run", { "i", "v" })
bind("<F6>", "normcheck", "i")
bind("<F7>", "wmake", "i")
bind("<F8>", "valgrind", "i")

return M

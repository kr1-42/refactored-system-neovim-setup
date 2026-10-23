local map = vim.keymap.set

-- General
map("n", ";", ":")
map("n", "<C-D>", "<C-D>zz")
map("n", "<C-S>", "<C-B>zz")
map("i", "jj", "<Esc>")
map("n", "<C-N>", ":bnext<CR>")
map("n", "<C-P>", ":bprev<CR>")

-- Floating terminal (toggle; the shell keeps running while hidden)
local term = { buf = nil, win = nil }
local function toggle_term()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    term.win = nil
    return
  end
  if not (term.buf and vim.api.nvim_buf_is_valid(term.buf)) then
    term.buf = vim.api.nvim_create_buf(false, true)
  end
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  term.win = vim.api.nvim_open_win(term.buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })
  if vim.bo[term.buf].buftype ~= "terminal" then
    vim.fn.termopen(vim.o.shell, { on_exit = function() term.buf = nil end })
  end
  vim.cmd("startinsert")
end
map({ "n", "t" }, "<leader>t", toggle_term)
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- PDF page navigation (PDFview)
map("n", "<leader>jj", function() require("pdfview.renderer").next_page() end)
map("n", "<leader>kk", function() require("pdfview.renderer").previous_page() end)

-- Auto-pairs
map("i", "$6", "()<Left>")
map("i", "$2", "#include \"\"<Left>")
map("i", "$3", "[]<Left>")
map("i", "$4", "{}<Left>")
map("i", "$1", "{<CR>}<Esc>O")
map("i", "$q", "''<Left>")
map("i", "$e", '""<Left>')

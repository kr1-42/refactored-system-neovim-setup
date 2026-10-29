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
map("n", "<leader>t", toggle_term)   -- normal mode only, so " t" typed in the shell isn't hijacked
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Splits: <leader>s is the split prefix
map("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split horizontally" })
map("n", "<leader>sx", "<Cmd>close<CR>", { desc = "Close split" })
map("n", "<leader>so", "<Cmd>only<CR>", { desc = "Keep only this split" })
map("n", "<leader>s=", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sr", "<C-w>r", { desc = "Rotate splits" })
map("n", "<leader>sm", "<C-w>|<C-w>_", { desc = "Maximize split" })

-- Move between splits (from a terminal buffer press Esc Esc first)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move the current split to the far left / bottom / top / right
map("n", "<leader>sH", "<C-w>H")
map("n", "<leader>sJ", "<C-w>J")
map("n", "<leader>sK", "<C-w>K")
map("n", "<leader>sL", "<C-w>L")

-- Resize
map("n", "<leader>s<Left>", "<Cmd>vertical resize -5<CR>")
map("n", "<leader>s<Right>", "<Cmd>vertical resize +5<CR>")
map("n", "<leader>s<Up>", "<Cmd>resize +3<CR>")
map("n", "<leader>s<Down>", "<Cmd>resize -3<CR>")

-- File tree and buffers
map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "File tree" })
map("n", "<leader>bd", "<Cmd>bprevious<Bar>bdelete #<CR>", { desc = "Close buffer, keep the split" })

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

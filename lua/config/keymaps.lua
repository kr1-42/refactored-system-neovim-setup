local map = vim.keymap.set

-- General
map("n", ";", ":")
map("n", "<C-D>", "<C-D>zz")
map("n", "<C-S>", "<C-B>zz")
map("i", "jj", "<Esc>")
map("n", "<C-N>", ":bnext<CR>")
map("n", "<C-P>", ":bprev<CR>")

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

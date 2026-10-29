local opt = vim.opt

-- Indentation
opt.tabstop = 4        -- A tab character displays as 4 spaces
opt.shiftwidth = 4     -- Indentation width for >>, <<, and autoindent
opt.expandtab = true   -- Insert spaces instead of tab characters
opt.softtabstop = 4    -- Backspace deletes 4 spaces at a time
opt.autoindent = true  -- Copy indent from previous line
opt.smartindent = true -- Smart autoindent for code

-- General
opt.backup        = false
opt.cmdheight     = 1
opt.confirm       = true
opt.hidden        = true
opt.mouse         = "a"
opt.number        = true
opt.showcmd       = true
opt.swapfile      = false
opt.termguicolors = true
opt.wrap          = false

-- Look and feel
opt.cursorline    = true
opt.relativenumber = true   -- current line shows its absolute number
opt.signcolumn    = "yes"   -- no text shifting when signs appear
opt.scrolloff     = 8
opt.sidescrolloff = 8
opt.splitright    = true
opt.splitbelow    = true
opt.showmode      = false   -- lualine already shows the mode
opt.laststatus    = 3       -- single global statusline
opt.ignorecase    = true
opt.smartcase     = true
opt.updatetime    = 250
opt.pumheight     = 12
opt.fillchars     = { eob = " " }  -- hide the ~ after the end of the buffer
opt.writebackup   = false

-- Disable netrw (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

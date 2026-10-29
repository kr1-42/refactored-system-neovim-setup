# Neovim config

A personal Neovim setup (Neovim 0.11+, plugins managed with [lazy.nvim](https://github.com/folke/lazy.nvim)), geared toward C development at 42: norminette, valgrind, and the 42 header are one keypress away.

Leader key is **Space**.

## Layout

```
init.lua                  entry point, loads everything below
lua/config/options.lua    editor settings (4-space indent, no swap files, mouse on...)
lua/config/lazy.lua       installs lazy.nvim and loads lua/plugins/
lua/config/keymaps.lua    general keys and auto-pairs
lua/config/runners.lua    F5-F8 build / check / run helpers
lua/config/autocmds.lua   opens .pdf files in PDFview
lua/config/mac.lua        macOS-only overrides (loaded only when has("mac"))
lua/plugins/*.lua         one file per plugin group
plugin/*.vim              vimscript loaded automatically at startup
```

To add a plugin, put its spec in any file under `lua/plugins/` and restart.

## Plugins

| Group | Plugins |
|---|---|
| AI | Copilot, Claude Code (claudecode.nvim) |
| Look | kanagawa (active theme), nord, cyberdream, melange; lualine statusline with the open buffers as tabs along the bottom; gitsigns |
| Editing | treesitter, multiple-cursors, stcursorword (underlines the word under the cursor) |
| Files | nvim-tree |
| Docs | md-pdf (Markdown to PDF), PDFview (read PDFs inside Neovim) |
| Practice | vim-be-good (`:VimBeGood` or `<leader>G`) |
| Other | luxterm (terminal), nvim-cmp (installed, not configured yet) |

## Keys

### Build and run
| Key | Action |
|---|---|
| `F2` | Insert / update the 42 header |
| `F5` | Save, compile and run the current file (C, C++, Java, sh, Python, Go, Octave) |
| `F6` | Save and run `norminette` on the file |
| `F7` | Save, `make`, open `main.c`, then compile and run |
| `F8` | Save and run `valgrind` on `./a.out` |

### General
| Key | Action |
|---|---|
| `;` | `:` (command line) |
| `jj` | Leave insert mode |
| `Ctrl-N` / `Ctrl-P` | Next / previous buffer |
| `Ctrl-D` / `Ctrl-S` | Half page down / full page up, cursor centered |
| `<leader>,` | Convert Markdown to PDF |
| `<leader>jj` / `<leader>kk` | Next / previous PDF page |

### Splits and buffers
| Key | Action |
|---|---|
| `<leader>sv` / `<leader>sh` | Split vertically / horizontally |
| `Ctrl-H/J/K/L` | Move to the split left / down / up / right |
| `<leader>sx` / `<leader>so` | Close this split / keep only this one |
| `<leader>sH/J/K/L` | Move this split to the far left / bottom / top / right |
| `<leader>s` + arrows | Resize the split |
| `<leader>s=` / `<leader>sm` / `<leader>sr` | Equalize / maximize / rotate |
| `<leader>e` | Toggle the file tree |
| `<leader>bd` | Close the buffer but keep the split |

From a terminal buffer (floating terminal, Claude), press `Esc Esc` before using the keys above.

### Auto-pairs (insert mode)
| Type | Get |
|---|---|
| `$6` | `()` |
| `$3` | `[]` |
| `$4` | `{}` |
| `$1` | `{` + newline + `}` block |
| `$q` / `$e` | `''` / `""` |
| `$2` | `#include ""` |

### Multiple cursors
| Key | Action |
|---|---|
| `Ctrl-Up` / `Ctrl-Down` | Add a cursor above / below |
| `Ctrl-Click` | Add or remove a cursor |
| `<leader>c` | Add cursors on every match of the word |
| `<leader>C` | Same, limited to the previous visual area |
| `<leader>d` / `<leader>D` | Add cursor at next match / jump to next match |
| `<leader>m` (visual) | Add a cursor on each selected line |
| `<leader>l` | Lock cursors |

### Claude Code
Needs the `claude` command-line tool installed and on your PATH.

| Key | Action |
|---|---|
| `<leader>ac` | Open / close Claude |
| `<leader>af` | Focus the Claude window |
| `<leader>ar` / `<leader>aC` | Resume / continue a previous session |
| `<leader>am` | Pick the model |
| `<leader>ab` | Send the current file to Claude |
| `<leader>as` | Send the selection (visual) or the file under the cursor (in nvim-tree) |
| `<leader>aa` / `<leader>ad` | Accept / reject a proposed change |

## Commands

- `:Stdheader` — insert the 42 header (also updated automatically on save)
- `:GDB [program]` — open gdb in a terminal split
- `:ClaudeCode` — open Claude Code

## Automatic behavior

- Opening a `.pdf` shows it in PDFview.
- Opening a `README.md` appends your login and a timestamp to its first line (`plugin/rmautologin.vim`).
- The background is transparent, so the terminal's background shows through.

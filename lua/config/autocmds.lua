-- Open PDFs in PDFview
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    require("pdfview").open(vim.api.nvim_buf_get_name(0))
  end,
})

-- Quit instead of leaving nvim-tree as the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local tree_wins, float_count = {}, 0
    for _, w in ipairs(wins) do
      if vim.bo[vim.api.nvim_win_get_buf(w)].filetype == "NvimTree" then
        table.insert(tree_wins, w)
      elseif vim.api.nvim_win_get_config(w).relative ~= "" then
        float_count = float_count + 1
      end
    end
    if #wins - #tree_wins - float_count == 1 then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

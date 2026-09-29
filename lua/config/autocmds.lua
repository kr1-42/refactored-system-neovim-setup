-- Open PDFs in PDFview
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    require("pdfview").open(vim.api.nvim_buf_get_name(0))
  end,
})

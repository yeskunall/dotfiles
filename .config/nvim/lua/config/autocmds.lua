-- Show cursor lines only in the active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

--

-- Zig

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  pattern = { ".zig", ".zon" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.zig", "*.zon" },
  callback = function()
    vim.lsp.buf.code_action {

      apply = true,
      context = { only = { "source.fixAll" } },
    }
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.zig", "*.zon" },
  callback = function(ev)
    vim.lsp.buf.code_action {
      context = { only = { "source.organizeImports" } },
      apply = true,
    }
  end,
})

--

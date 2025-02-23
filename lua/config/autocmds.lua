
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

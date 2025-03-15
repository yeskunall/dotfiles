vim.g.deprecation_warnings = true

vim.g.lazyvim_picker = "fzf"
-- Better coop with `fzf-lua`
vim.env.FZF_DEFAULT_OPTS = ""

vim.g.lazyvim_prettier_needs_config = false

vim.g.material_style = "deep ocean"

vim.filetype.add {
  extension = {
    vto = "vento",
  },
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gotham",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Launch lazygit, properly configured to use the current colorscheme and integrate with the current neovim instance",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen mode",
      },
    },
    opts = {
      dim = { enabled = true, scope = { min_size = 3, siblings = false } },
      lazygit = { configure = true, enabled = true },
      scroll = { animate = { duration = { total = 150 } }, enabled = true },
      words = { enabled = false },
      zen = { enabled = true },
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {
      langs = {
        dts = "// %s",
      },
    },
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    sources = {
      { name = "nvim_lsp" },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost" },
    opts = {
      linters_by_ft = {
        markdown = { "vale" },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        custom = {
          ".DS_Store$",
          "^.git$",
        },
        git_ignored = false,
      },
      view = {
        side = "right",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = { "BufWritePre" },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        ["javascript"] = { "prettierd", "prettier", stop_after_first = true },
        ["javascriptreact"] = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
        lua = { "stylua" },
        ["typescript"] = { "prettierd", "prettier", stop_after_first = true },
        ["typescriptreact"] = {
          "prettierd",
          "prettier",
          stop_after_first = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  {
    "whatyouhide/vim-gotham",
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "css-lp",
        "prettier",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "stylua",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "dockerfile",
        "editorconfig",
        "gitignore",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "markdown_inline",
        "sql",
        "ssh_config",
        "typescript",
        "xml",
      },
      highlight = { enable = true },
      sync_install = false,
    },
  },
}

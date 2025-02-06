return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gotham",
    },
  },

  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },

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
    "mfussenegger/nvim-lint",
    event = { "BufWritePost" },
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        markdown = { "vale" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
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
        ["javascript"] = {
          ---"prettierd",
          "eslint_d",
          "prettier",
          stop_after_first = true,
        },
        ["javascriptreact"] = {
          ---"prettierd",
          "eslint_d",
          "prettier",
          stop_after_first = true,
        },
        lua = { "stylua" },
        ["typescript"] = {
          ---"prettierd",
          "eslint_d",
          "prettier",
          stop_after_first = true,
        },
        ["typescriptreact"] = {
          ---"prettierd",
          "eslint_d",
          "prettier",
          stop_after_first = true,
        },
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
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "prettier",
        "prettierd",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vale-ls",
        "yaml-language-server",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
        cssls = {},
        eslint = {
          settings = {
            useFlatConfig = true,
            experimental = {
              useFlatConfig = nil,
            },
          },
        },
        html = {},
        lua_ls = {},
        tailwindcss = {},
        ts_ls = {},
        vale_ls = {},
        yamlls = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "dockerfile",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitignore",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "sql",
        "ssh_config",
        "toml",
        "typescript",
        "vento",
        "yaml",
        "yaml",
        "xml",
      },
      highlight = { enable = true },
      sync_install = false,
    },
  },
}

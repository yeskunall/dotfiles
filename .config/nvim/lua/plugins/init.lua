return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    ft = { "typst" },
    version = "1.*",
    opts = {
      dependencies_bin = { ["tinymist"] = "tinymist" },
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
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
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

  -- https://github.com/mfussenegger/nvim-lint/issues/679
  -- https://github.com/mfussenegger/nvim-lint/issues/685
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost" },
    config = function()
      local lint = require "lint"
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWritePost", "InsertLeave" },
        {
          group = lint_augroup,
          callback = function(args)
            local filetype =
              vim.api.nvim_get_option_value("filetype", { buf = args.buf })
            local override = nil

            if
              vim.tbl_contains({
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
              }, filetype)
            then
              if
                require("lspconfig.util").root_pattern(
                  "deno.json",
                  "deno.jsonc"
                )(args.buf)
              then
                override = { "deno" }
              end
            end

            lint.try_lint(override)
          end,
        }
      )
    end,
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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
        cssls = {},
        denols = {
          filetypes = { "typescript", "typescriptreact" },

          root_dir = function(...)
            return require("lspconfig.util").root_pattern(
              "deno.jsonc",
              "deno.json"
            )(...)
          end,
        },
        emmet_language_server = {
          -- TODO: find a way to extend the existing filetypes instead of
          -- rewriting them
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
            "vento",
          },
        },
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
        ruby_lsp = {},
        tailwindcss = {},
        tinymist = {
          settings = {
            formatterMode = "typstyle",
          },
        },
        ts_ls = {},
        vale_ls = {},
        vtsls = {
          root_dir = require("lspconfig.util").root_pattern "package.json",
        },
        yamlls = {},
        zls = {
          settings = {
            semantic_tokens = "partial",
          },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          position = "right",
        },
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
        "ruby",
        "sql",
        "ssh_config",
        "toml",
        "typescript",
        "vento",
        "yaml",
        "yaml",
        "xml",
        "zig",
      },
      highlight = { enable = true },
      sync_install = false,
    },
  },

  {
    "sindrets/diffview.nvim",
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
      formatters = {
        eslint_d = {
          cwd = require("conform.util").root_file { "eslint.config.mjs" },
          require_cwd = true,
        },
        prettierd = {
          cwd = require("conform.util").root_file { ".prettierignore" },
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        blade = { "blade-formatter" },
        javascript = {
          "eslint_d",
          "prettierd",
          stop_after_first = true,
        },
        javascriptreact = {
          "eslint_d",
          "prettierd",
          stop_after_first = true,
        },
        lua = { "stylua" },
        ruby = { "rubocop" },
        typescript = {
          "eslint_d",
          "prettierd",
          stop_after_first = true,
        },
        typescriptreact = {
          "eslint_d",
          "prettierd",
          stop_after_first = true,
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "prettierd",
        "stylua",
        "tailwindcss-language-server",
        "tinymist",
        "typescript-language-server",
        "vale-ls",
        "yaml-language-server",
        "zls",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}

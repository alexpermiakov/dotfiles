return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      go = { "goimports", "gofmt", "gofumpt" },
      -- You can use a function here to determine the formatters dynamically
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      terraform = { "terraform_fmt" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      less = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      graphql = { "prettier" },
      handlebars = { "prettier" },
      json = { "prettier" },
      -- Use the "*" filetype to run formatters on all filetypes.
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}

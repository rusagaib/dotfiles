return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- setting formater yang akan dipakai

    null_ls.setup({
      sources = {
        -- stylua
        null_ls.builtins.formatting.stylua,

        -- prettier
        null_ls.builtins.formatting.prettier.with {
          filetypes = {
            "css",
            "html",
            "javascript",
            "typescript",
            "json",
            "yaml",
            "python",
            "go",
            "php",
            "blade",
            "vue",
          },
          dynamic_command = function()
            return "prettier"
          end,
        },

        -- null_ls.builtins.diagnostics.phpstan.with({
        -- extra_args = {
        -- "--memory-limit=2G",
        -- }
        -- })

      }
    })


    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end
}

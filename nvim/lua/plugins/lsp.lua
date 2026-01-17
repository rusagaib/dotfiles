return {
  -- Mason core
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },

  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "emmet_ls",
          "html",
          "cssls",
          "tailwindcss",
          "marksman",
          "bashls",
          "intelephense",
          "gopls",
          "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local default_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
      end

      -- ====================
      -- Custom LSP setups
      -- ====================

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = default_attach,
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        },
      })

      -- TypeScript / JavaScript / Vue / Svelte
      lspconfig.ts_ls.setup({
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        filetypes = { "typescript", "javascript", "vue" },
        capabilities = capabilities,
        on_attach = default_attach,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath("data") ..
                  "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
              languages = { "typescript", "javascript", "vue" },
            },
            {
              name = "typescript-svelte-plugin",
              location = vim.fn.stdpath("data") ..
                  "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
              languages = { "typescript", "javascript", "svelte" },
            },
          },
        },
      })

      -- PHP
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = default_attach,
        root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
        flags = { debounce_text_changes = 150 },
        settings = {
          intelephense = {
            files = {
              associations = { "*.php", "*.phtml", "*.module", "*.inc" },
              maxSize = 1000000,
            },
          },
        },
      })

      -- Tailwind, HTML, CSS
      lspconfig.tailwindcss.setup({ capabilities = capabilities, on_attach = default_attach })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })

      -- Markdown
      lspconfig.marksman.setup({ capabilities = capabilities })

      -- Bash
      lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = function(client)
          default_attach(client)
          vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
        end,
      })

      -- Python
      lspconfig.pyright.setup({ capabilities = capabilities, on_attach = default_attach })

      -- Go
      lspconfig.gopls.setup({ capabilities = capabilities, on_attach = default_attach })

      -- YAML
      lspconfig.yamlls.setup({ capabilities = capabilities, on_attach = default_attach })

      -- Emmet
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "html", "javascript", "sass", "scss", "php", "vue", "yaml" },
        init_options = { html = { options = { ["bem.enabled"] = true } } },
      })

      -- ====================
      -- LSP popup transparan
      -- ====================
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "rounded", winblend = 20 }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded", winblend = 20 }
      )

      -- ====================
      -- Keymaps
      -- ====================
      local opts = { noremap = true, silent = true }
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gD", vim.lsp.buf.declaration, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<C-p>", vim.diagnostic.goto_prev, opts)
      map("n", "<A-p>", vim.diagnostic.goto_next, opts)
      map("n", "<leader>E", vim.diagnostic.open_float, opts)
      map("n", "<leader>q", vim.diagnostic.setloclist, opts)
      map("n", "<F2>", vim.lsp.buf.rename, opts)
      map("n", "<leader>k", vim.lsp.buf.signature_help, opts)
      map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
    end,
  },
}

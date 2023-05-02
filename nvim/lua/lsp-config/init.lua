-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { 
      "javascript", "javascriptreact", "javascript.jsx",
      "typescript", "typescriptreact", "typescript.tsx" 
    },
    cmd = { "typescript-language-server", "--stdio" }
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['emmet_ls'].setup{
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'php', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}
require('lspconfig')['cssmodules_ls'].setup{
    cmd = { "cssmodules-language-server" },
    filetypes = { "javascript", "javascriptreact",
                  "typescript", "typescriptreact" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {},
}
require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  },
  single_file_supprt = true
}
require('lspconfig')['html'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {},
    init_options = {
        configurationSection = {
          "html", "css", "javascript",
          "php", "vue", "astro"
        },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
}
require('lspconfig')['intelephense'].setup {
  on_attach=on_attach,
  capabilities=capabilities,
  settings = { intelephense =  { files = { associations = {"*.php", "*.phtml", "*.module", "*.inc"}}}}
}
require('lspconfig')['yamlls'].setup {
  on_attach=on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
      yaml = {
          schemas = {
              ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
          }
      }
  }
}
require('lspconfig')['lua_ls'].setup {}
require('lspconfig')['volar'].setup {
  on_attach = on_attach,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  cmd = { "vue-language-server", "--stdio" }
}
require('lspconfig')['astro'].setup {
  on_attach = on_attach,
  filetypes = { "astro" },
  cmd = { "astro-ls", "--stdio" }
}
require('lspconfig')['tailwindcss'].setup {
  on_attach = on_attach,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
  cmd = { "tailwindcss-language", "--stdio" },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    },
  },
}
require('lspconfig')['marksman'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'markdown' },
  cmd = { "marksman", "server" },
  single_file_support = true
}

local status_ok_mason, mason = pcall(require, 'mason')
if (not status_ok_mason) then return end
local status_ok_lspconfig, lspconfig = pcall(require, 'mason-lspconfig')
if (not status_ok_lspconfig) then return end

mason.setup {}
lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "intelephense",
    "volar",
    "astro",
    "tsserver",
    "cssmodules_ls",
    "tailwindcss",
    "marksman"
  }
}

-- lsp-config setup 
require('lspconfig')['volar'].setup {}
require('lspconfig')['astro'].setup {}
require('lspconfig')['cssmodules_ls'].setup {}
require('lspconfig')['tailwindcss'].setup {
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
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
require('lspconfig')['marksman'].setup {}

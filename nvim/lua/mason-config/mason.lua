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
    "tailwindcss"
  }
}

require('lspconfig')['volar'].setup {}
require('lspconfig')['astro'].setup {}
require('lspconfig')['cssmodules_ls'].setup {}
require('lspconfig')['tailwindcss'].setup {}

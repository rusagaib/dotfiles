-- load from friendly-snippets plugin
-- local vs_path = vim.fn.stdpath('data')..'/site/pack/packer/start/friendly-snippets/'

-- load local snippets 
local snippets_folder = vim.fn.stdpath("config") .. "/lua/snippets/"
-- end local load

-- Config
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
  history = true,

  updateevents = "TextChanged, TextChangedI",

  enable_autosnippets = false,


}

-- load snippets
require("luasnip.loaders.from_vscode").load()
-- require("luasnip.loaders.from_vscode").load({
--   paths=vs_path,
--   exclude={'javascript'}
-- })

-- apply local snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = snippets_folder })









return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- local configs = require("nvim-treesitter.config")
		local configs = require("nvim-treesitter")
		configs.setup({
			ensure_installed = {
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"go",
				"json",
				"php",
				"phpdoc",
				"blade",
				"python",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}

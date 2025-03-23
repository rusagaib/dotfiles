return {
	-- common general
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	{ "tpope/vim-dispatch", lazy = true, cmd = { "Dispatch", "Make", "Focus", "Start" } },

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the 'config' key)
	{
		"w0rp/ale",
		ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
		cmd = "ALEEnable",
		config = function()
			vim.cmd([[ALEEnable]])
		end,
	},

	-- Post-install/update hook with neovim command
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- clipboard manager
	"AckslD/nvim-neoclip.lua",

	-- adding float term for lazygit
	"voldikss/vim-floaterm",

	-- -- adding swagger-preview
	-- "rusagaib/oas-preview.nvim",
	{
		"rusagaib/oas-preview.nvim",
		config = function()
			require("oas-preview").setup({
				api_route = "http://127.0.0.1",
				port = "1111", -- up-to-you
				ui = "swagger", -- "swagger", "redoc", "stoplight"
				-- auto_open_url = true, -- false to disable it, default is true
			})
		end,
	},
}

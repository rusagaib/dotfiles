return {
	-- Telescope plugin
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<C-x>"] = actions.delete_buffer, -- Delete buffers in insert mode
								-- ["<C-x>"] = actions.delete_buffer + actions.move_to_top, -- Delete buffers in insert mode
							},
							n = {
								["<C-x>"] = actions.delete_buffer, -- Delete buffers in normal mode
								-- ["<C-x>"] = actions.delete_buffer + actions.move_to_top, -- Delete buffers in normal mode
							},
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- Customize `ui-select` appearance here
							-- Uncomment and modify the options as per your preferences
							-- winblend = 15,
							-- layout_config = {
							--   prompt_position = "top",
							--   width = 0.8,
							--   height = 0.6,
							-- },
						}),
					},
				},
			})

			-- Load the telescope extensions after setup
			telescope.load_extension("fzy_native")
			telescope.load_extension("file_browser")
			telescope.load_extension("media_files")
			telescope.load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
	},
}

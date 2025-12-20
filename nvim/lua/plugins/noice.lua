return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- default presets
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			lsp = {
				override = {
          -- override the default lsp markdown formatter with Noice
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- override the lsp markdown formatter with Noice
					["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
					["cmp.entry.get_documentation"] = false,
				},
        hover = {
          enabled = true,
          silent = true,
          view = nil,
          opts = {}
        }
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "fewer lines" },
						},
					},
					view = "mini",
				},
				{
					filter = {
						event = "msg_show",
						find = "No information available",
					},
					opts = {
						skip = true,
					},
				},
				-- {
				-- 	filter = {
				-- 		event = "lsp",
				-- 		kind = "hover",
				-- 	},
				-- 	view = "hover",
				-- },
				{
					filter = {
						event = "lsp",
						kind = "code_action",
					},
					view = "cmdline_popup",
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = 15,
						col = "50%",
					},
					border = {
						style = "rounded", -- none, rounded
						padding = { 0, 1 }, -- {2,3}, {0,1}
					},
					size = {
						min_width = 60,
						width = "auto",
						height = "auto",
					},
					win_options = {
						winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
					},
				},
				cmdline_popupmenu = {
					relative = "editor",
					position = {
						row = 18,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
						max_height = 15,
					},
					border = {
						style = "rounded", -- none, rounded
						padding = { 0, 1 }, -- {0,3} {0,1}
					},
					win_options = {
						winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
					},
				},
				hover = {
					border = {
						style = "single",
					},
				},
				confirm = {
					border = {
						style = "single",
					},
				},
				popup = {
					border = {
						style = "single",
					},
				},
				mini = {
					backend = "mini",
					relative = "editor",
					align = "message-right",
					timeout = 2000,
					reverse = true,
					focusable = false,
					position = {
						row = -1,
						col = "100%",
					},
					size = "auto",
					border = {
						style = "none",
					},
					zindex = 60,
					win_options = {
						winbar = "",
						foldenable = false,
						winblend = 0,
						winhighlight = {
							Normal = "NoiceMini",
							IncSearch = "",
							CurSearch = "",
							Search = "",
						},
					},
				},
			},
		})

		-- FYI ( Visual Representation ):
		-- info: General informational messages.
		-- warn: Warnings that require attention but are not critical.
		-- error: Critical errors that need immediate action.
		-- debug: Debug-level messages for development purposes.
		-- trace: Highly detailed trace logs, usually for in-depth debugging.

		-- Auto commands for recording start/stop
		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				require("notify")("Recording Started", "info", { title = "Macro" })
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				require("notify")("Recording Stopped", "warn", { title = "Macro" })
			end,
		})
	end,
}

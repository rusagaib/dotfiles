return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git", -- also try out "git_branch"
		icons = false, -- setting to "true" requires "nvim-web-devicons"
		status = false,
	},
}

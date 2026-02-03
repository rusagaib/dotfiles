-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap

-- open curl tab on current working directory
keymap.set(
	"n",
	"<leader>cc",
	"<cmd>lua require('curl').open_curl_tab()<cr>",
	{ noremap = true, silent = true, desc = "Open a curl tab scoped to the current working directory" }
)
-- keymap.set("n", "<leader>cc", function()
--    require("curl").open_curl_tab()
-- end, { desc = "Open a curl tab scoped to the current working directory" })

-- open curl tab on global scoped
keymap.set(
	"n",
	"<leader>co",
	"<cmd>lua require('curl').open_global_tab()<cr>",
	{ noremap = true, silent = true, desc = "Open a curl with gloabl scope" }
)

-- These commands will prompt you for a name for your collection
keymap.set(
	"n",
	"<leader>csc",
	"<cmd>lua require('curl').create_scoped_collection()<cr>",
	{ noremap = true, silent = true, desc = "Create or open a collection with a name from user input" }
)

-- open curl on global collection
keymap.set(
	"n",
	"<leader>cgc",
	"<cmd>lua require('curl').create_global_collection()<cr>",
	{ noremap = true, silent = true, desc = "Create or open a global collection with a name from user input" }
)

-- pick and open scoped collection
keymap.set(
	"n",
	"<leader>fsc",
	"<cmd>lua require('curl').pick_scoped_collection()<cr>",
	{ noremap = true, silent = true, desc = "Choose a scoped collection and open it" }
)

-- pick and open from global collection
keymap.set(
	"n",
	"<leader>fgc",
	"<cmd>lua require('curl').pick_global_collection()<cr>",
	{ noremap = true, silent = true, desc = "Choose a global collection and open it" }
)

local keymap = vim.keymap

keymap.set("n", "<leader>a", "<cmd>Grapple toggle<cr>", { noremap = true, silent = true, desc = "Tag a file" })
keymap.set(
	"n",
	"<leader>h",
	"<cmd>Grapple toggle_tags<cr>",
	{ noremap = true, silent = true, desc = "Toggle tags menu" }
)
keymap.set(
	"n",
	"<leader>1",
	"<cmd>Grapple select index=1<cr>",
	{ noremap = true, silent = true, desc = "Select first tag" }
)
keymap.set(
	"n",
	"<leader>2",
	"<cmd>Grapple select index=2<cr>",
	{ noremap = true, silent = true, desc = "Select second tag" }
)
keymap.set(
	"n",
	"<leader>3",
	"<cmd>Grapple select index=3<cr>",
	{ noremap = true, silent = true, desc = "Select third tag" }
)
keymap.set(
	"n",
	"<leader>4",
	"<cmd>Grapple select index=4<cr>",
	{ noremap = true, silent = true, desc = "Select fourth tag" }
)
keymap.set(
	"n",
	"<leader>5",
	"<cmd>Grapple select index=5<cr>",
	{ noremap = true, silent = true, desc = "Select fifth tag" }
)
keymap.set(
	"n",
	"<leader>n",
	"<cmd>Grapple cycle_tags next<cr>",
	{ noremap = true, silent = true, desc = "Go to next tag" }
)
keymap.set(
	"n",
	"<leader>p",
	"<cmd>Grapple cycle_tags prev<cr>",
	{ noremap = true, silent = true, desc = "Go to previous tag" }
)

local keymap = vim.keymap

keymap.set(
	"c",
	"<S-Enter>",
	[[<cmd>lua require("noice").redirect(vim.fn.getcmdline())<CR>]],
	{ noremap = true, silent = true, desc = "Redirect Cmdline" }
)
keymap.set(
	"n",
	"<leader>snl",
	[[<cmd>lua require("noice").cmd("last")<CR>]],
	{ noremap = true, silent = true, desc = "Noice Last Message" }
)
keymap.set(
	"n",
	"<leader>snh",
	[[<cmd>lua require("noice").cmd("history")<CR>]],
	{ noremap = true, silent = true, desc = "Noice History" }
)
keymap.set(
	"n",
	"<leader>sna",
	[[<cmd>lua require("noice").cmd("all")<CR>]],
	{ noremap = true, silent = true, desc = "Noice All" }
)
keymap.set(
	"n",
	"<leader>snd",
	[[<cmd>lua require("noice").cmd("dismiss")<CR>]],
	{ noremap = true, silent = true, desc = "Dismiss All" }
)
keymap.set(
	"i",
	"<c-f>",
	[[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap.set(
	"n",
	"<c-f>",
	[[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap.set(
	"s",
	"<c-f>",
	[[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap.set(
	"i",
	"<c-b>",
	[[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)
keymap.set(
	"n",
	"<c-b>",
	[[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)
keymap.set(
	"s",
	"<c-b>",
	[[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
	{ noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)

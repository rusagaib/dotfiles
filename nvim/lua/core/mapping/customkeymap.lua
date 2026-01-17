local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- Saving files with notify
-- fast saving with leader and S
-- keymap.set("n", "<leader>S", ":w<CR>", opts)
keymap.set("n", "<leader>S", ":lua require('utils').scripts.NotifySaved()<CR>", opts)
-- require('notify')("Recording Started", "info", { title = "Macro" })
-- notify for right saved ising <leader>S not s tho..
-- keymap.set("n", "<leader>s", [[:lua NotifySave<CR>]], opts)
keymap.set("n", "<leader>s", ":lua require('utils').scripts.NotifySave()<CR>", opts)
-- require('notify')("Recording Started", "info", { title = "Macro" })
-- keymap.set("n", "<leader>s", ":echo 'Writes files with leader-s'<CR>", opts)
-- keymap.set("i", "<leader>s", "<C-c>:w<CR>", opts)

-- Open explorer with Oil
keymap.set("n", "<leader>-", "<CMD>Oil<CR>", opts)
-- keymap.set("n", "<leader>-", ":Explore<CR>", opts)
-- keymap.set("n", "<leader>ee", ":Explore<CR>", opts)
-- keymaset("n", "<leader>E", ":Explore<Return>", opts)

-- Search & replace
keymap.set(
	"v",
	"<leader>sr",
	":lua require('utils').scripts.FNReplaceWords(vim.fn.input('Query: '), vim.fn.input('New Word: '))<CR>",
	opts
)

-- Launch Lazygit via floatterm
keymap.set(
	"n",
	"<leader>L",
	"<cmd>FloatermNew --height=0.95 --width=0.95 --wintype=float --name=lazygit lazygit<cr>",
	opts
)

-- launch mocp via floatterm
keymap.set("n", "<leader>mz", "<cmd>FloatermNew --height=0.80 --width=0.80 --wintype=float --name=mocp mocp<cr>", opts)

-- open url under cursors
keymap.set("n", "gx", ":lua require('utils').scripts.OpenUrl()<CR>", opts)

-- codesnap
keymap.set(
	"v",
	"<leader>mp",
	"<cmd>CodeSnap<cr>",
	{ noremap = true, silent = true, desc = "Save selected code snapshot into clipboard" }
)

-- mpd
keymap.set(
	"v",
	"<leader>mpd",
	"<cmd>CodeSnapSave<cr>",
	{ noremap = true, silent = true, desc = "Save selected code snapshot in ~/Pictures" }
)

-- toggle emmet_lsp
keymap.set(
	"n",
	"<leader>lspe",
	":lua require('utils').scripts.ToggleEmmetLs()<CR>",
	{ noremap = true, silent = true }
)

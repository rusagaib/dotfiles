local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap

-- Load autocomand scripts
-- local scripts = require('utils')

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Reload config without restart nvim
keymap("n", "<leader>r", ":so %<CR>", opts)

-- fast saving with leader and S
-- keymap("n", "<leader>S", ":w<CR>", opts)
keymap("n", "<leader>S", ":lua require('utils').scripts.NotifySaved()<CR>", opts)
-- require('notify')("Recording Started", "info", { title = "Macro" })

-- notify for right saved ising <leader>S not s tho..
-- keymap("n", "<leader>s", [[:lua NotifySave<CR>]], opts)
keymap("n", "<leader>s", ":lua require('utils').scripts.NotifySave()<CR>", opts)
-- require('notify')("Recording Started", "info", { title = "Macro" })
-- keymap("n", "<leader>s", ":echo 'Writes files with leader-s'<CR>", opts)
-- keymap("i", "<leader>s", "<C-c>:w<CR>", opts)

-- fast Open explorer
keymap("n", "<leader>-", "<CMD>Oil<CR>", opts)
-- keymap("n", "<leader>ee", ":Explore<CR>", opts)
-- keymaset("n", "<leader>E", ":Explore<Return>", opts)

-- Increment/decrement
-- 6
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete a word backward
-- keymap("n", "dw", "vb_d")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Navigate tab
-- cus idunno there some config mapping with tabprevious with gt
-- then let it be~
-- i just add tt to tabnew
keymap("n", "tt", ":tabnew<CR>", opts)
keymap("n", "tn", ":tabNext<CR>", opts)
keymap("n", "tr", ":tabclose<Return>", opts)
-- keymap("n", "<leader>td", ":tabclose<Return>", opts)

-- split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- list all buffers
keymap("n", "<leader>bv", ":buffers<Return>", opts)

-- Window organize
-- Move the right split to the left
keymap("n", "<leader>ml", ":wincmd H<CR>", opts)
-- Move the left split to the right
keymap("n", "<leader>mr", ":wincmd L<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Close buffers
-- this can be dangerous so becarefull
--keymap("n", "<leader>b", ":b", opts)
keymap("n", "<leader>bn", ":bd", opts)
keymap("n", "<C-q>", ":q", opts)

-- Clear latest search
keymap("n", "<leader>cl", ":nohlsearch<CR>", opts)

-- Usefull replace using Ragex
-- change single quote to double quote
-- keymap("v", "<leader>gr", ":s/\%V'\%V/"/g", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- keymap("n", "<leader>S", ":lua require('utils').scripts.NotifySaved()<CR>", opts)
-- Search & replace
keymap(
  "v",
  "<leader>sr",
  ":lua require('utils').scripts.FNReplaceWords(vim.fn.input('Query: '), vim.fn.input('New Word: '))<CR>",
  opts
)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files().get_dropdown({ previewer = true })<cr>", opts)
-- keymap("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.find_files().get_dropdown({ previewer = true })<cr>", opts)

-- Telescope mapping
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope fd<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
-- keymap('n', '<leader>fl', "<cmd>Telescope marks<cr>", opts)
-- -- Code Action using Custom scripts
-- keymap('n', '<leader>ca', ":lua require('utils').scripts.ShowCodeAction()<CR>", opts)
keymap("n", "<leader>flf", ":lua require('utils').telefilter.lsp_document_symbols_filtered()<CR>", opts)
keymap("n", "<leader>fla", ":lua require('utils').telefilter.lsp_document_symbols_all()<CR>", opts)
keymap("n", "<leader>te", "<cmd>:tab terminal<cr>", opts)

-- Launch Lazygit via floatterm
keymap("n", "<leader>L", "<cmd>FloatermNew --height=0.95 --width=0.95 --wintype=float --name=lazygit lazygit<cr>", opts)

-- launch mocp via floatterm
keymap("n", "<leader>mz", "<cmd>FloatermNew --height=0.80 --width=0.80 --wintype=float --name=mocp mocp<cr>", opts)

-- enable cursor culomn
keymap("n", "<leader>ac", "<cmd>:set cursorcolumn<cr>", opts)

-- glance keymap
-- keymap("n", "gD", "<CMD>Glance definitions<CR>", opts)
-- keymap("n", "gR", "<CMD>Glance references<CR>", opts)
-- keymap("n", "gY", "<CMD>Glance type_definitions<CR>", opts)
-- keymap("n", "gM", "<CMD>Glance implementations<CR>", opts)

keymap(
  "c",
  "<S-Enter>",
  [[<cmd>lua require("noice").redirect(vim.fn.getcmdline())<CR>]],
  { noremap = true, silent = true, desc = "Redirect Cmdline" }
)
keymap(
  "n",
  "<leader>snl",
  [[<cmd>lua require("noice").cmd("last")<CR>]],
  { noremap = true, silent = true, desc = "Noice Last Message" }
)
keymap(
  "n",
  "<leader>snh",
  [[<cmd>lua require("noice").cmd("history")<CR>]],
  { noremap = true, silent = true, desc = "Noice History" }
)
keymap(
  "n",
  "<leader>sna",
  [[<cmd>lua require("noice").cmd("all")<CR>]],
  { noremap = true, silent = true, desc = "Noice All" }
)
keymap(
  "n",
  "<leader>snd",
  [[<cmd>lua require("noice").cmd("dismiss")<CR>]],
  { noremap = true, silent = true, desc = "Dismiss All" }
)
keymap(
  "i",
  "<c-f>",
  [[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap(
  "n",
  "<c-f>",
  [[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap(
  "s",
  "<c-f>",
  [[<cmd>lua if not require("noice.lsp").scroll(4) then return "<c-f>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll forward" }
)
keymap(
  "i",
  "<c-b>",
  [[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)
keymap(
  "n",
  "<c-b>",
  [[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)
keymap(
  "s",
  "<c-b>",
  [[<cmd>lua if not require("noice.lsp").scroll(-4) then return "<c-b>" end<CR>]],
  { noremap = true, silent = true, expr = true, desc = "Scroll backward" }
)

-- open url under cursors
keymap("n", "gx", ":lua require('utils').scripts.OpenUrl()<CR>", opts)

-- codesnap
keymap(
  "v",
  "<leader>mp",
  "<cmd>CodeSnap<cr>",
  { noremap = true, silent = true, desc = "Save selected code snapshot into clipboard" }
)
keymap(
  "v",
  "<leader>mpd",
  "<cmd>CodeSnapSave<cr>",
  { noremap = true, silent = true, desc = "Save selected code snapshot in ~/Pictures" }
)

-- toggle emmet_lsp
vim.api.nvim_set_keymap('n', '<leader>lspe', ":lua require('utils').scripts.ToggleEmmetLs()<CR>", { noremap = true, silent = true })

-- solely for Laravel Projk (laravelutls)
-- M.laravelutls = require('utils.laravelutls')
--
-- Laravel Inertia::class/inertia() helper Pages path picker (lip)
-- M.PickInertiaPage = function()
keymap(
  'n',
  '<leader>lip',
  [[<Esc>:lua require('utils').laravelutls.PickInertiaPage()<CR>]],
  { noremap = true, silent = true, desc = "[laravelutls] Laravel Inertia pages Picker (lip)" }
)
-- Laravel Blade resources/views path picker (lbv)
-- M.PickViewPage = function()
keymap(
  'n',
  '<leader>lbv',
  [[<Esc>:lua require('utils').laravelutls.PickViewPage()<CR>]],
  { noremap = true, silent = true, desc="[laravelutls] Laravel Blade resources View picker (lbv)" }
)
-- Laravel Inertia Search Resources UI (lir)
-- M.SearchInertiaResources = function()
keymap(
  'n',
  '<leader>lir',
  [[<Esc>:lua require('utils').laravelutls.SearchInertiaResources()<CR>]],
  { noremap = true, silent = true, desc="[laravelutls] Laravel Inertia search Resources (lir)" }
)
-- Laravel named routes (lnr)
-- M.SearchRouteNames = function()
keymap(
  'n',
  '<leader>lnr',
  [[<Esc>:lua require('utils').laravelutls.SearchRouteNames()<CR>]],
  { noremap = true, silent = true, desc="[laravelutls] Laravel Named Routes picker (lnr)" }
)
-- Laravel Spatie Permission Picker (lpp)
-- M.SpatiePermisionPicker = function()
keymap(
  'n',
  '<leader>lpp',
  [[<Esc>:lua require('utils').laravelutls.SpatiePermisionPicker()<CR>]],
  { noremap = true, silent = true, desc="[laravelutls] Laravel spatie Permission Picker (lpp)" }
)

require("mapping.maphelp")

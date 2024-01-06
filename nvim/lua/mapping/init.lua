local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Reload config without restart nvim 
keymap("n", "<leader>r", ":so %<CR>", opts)

-- fast saving with leader and s 
keymap("n", "<leader>s", ":w<CR>", opts)
-- keymap("i", "<leader>s", "<C-c>:w<CR>", opts)

-- fast Open explorer
keymap("n", "<leader>E", ":Explore<Return>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete a word backward
-- keymap("n", "dw", "vb'_d", opts)

-- Select all 
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Navigate tab
-- cus idunno there some config mapping with tabprevious with gt 
-- then let it be~
-- i just add tt to tabnew
keymap("n", "tt", ":tabnew<CR>", opts)
keymap("n", "tn", ":tabNext<CR>", opts)
-- keymap("n", "ty", ":tabclose<CR>", opts)
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
keymap("n", "<leader>bv", ":buffers<Return>", opts)

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
keymap("n", "<leader>te", "<cmd>:tab terminal<cr>", opts)

-- Launch Lazygit via floatterm
keymap("n", "<leader>lz", "<cmd>FloatermNew --height=0.95 --width=0.95 --wintype=float --name=lazygit lazygit<cr>", opts)

-- launch mocp via floatterm
keymap("n", "<leader>mz", "<cmd>FloatermNew --height=0.80 --width=0.80 --wintype=float --name=mocp mocp<cr>", opts)

-- enable cursor culomn
keymap("n", "<leader>ac", "<cmd>:set cursorcolumn<cr>", opts)

-- glance keymap 
keymap("n", "gD", "<CMD>Glance definitions<CR>", opts)
keymap("n", "gR", "<CMD>Glance references<CR>", opts)
keymap("n", "gY", "<CMD>Glance type_definitions<CR>", opts)
keymap("n", "gM", "<CMD>Glance implementations<CR>", opts)

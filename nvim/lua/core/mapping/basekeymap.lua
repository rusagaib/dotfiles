local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)
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
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Reload config without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>", opts)

-- Increment/decrement
-- Here: 6
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backward
-- keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Navigate tab
-- cus idunno there some config mapping with tabprevious with gt
-- then let it be~
-- i just add tt to tabnew
keymap.set("n", "tt", ":tabnew<CR>", opts)
keymap.set("n", "tn", ":tabNext<CR>", opts)
keymap.set("n", "tr", ":tabclose<Return>", opts)
-- keymap.set("n", "<leader>td", ":tabclose<Return>", opts)

-- split window
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
-- list all buffers
keymap.set("n", "<leader>bv", ":buffers<Return>", opts)

-- Window organize
-- Move the right split to the left
keymap.set("n", "<leader>ml", ":wincmd H<CR>", opts)
-- Move the left split to the right
keymap.set("n", "<leader>mr", ":wincmd L<CR>", opts)

-- Move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Close buffers
-- this can be dangerous so becarefull
--keymap.set("n", "<leader>b", ":b", opts)
-- buffer delete/remove
-- keymap.set("n", "<leader>br", ":bd", opts)
keymap.set("n", "<C-q>", ":q", opts)

-- Clear latest search
keymap.set("n", "<leader>cls", ":nohlsearch<CR>", opts)

-- Usefull replace using Ragex
-- change single quote to double quote
-- keymap.set("v", "<leader>gr", ":s/\%V'\%V/"/g", opts)

-- Insert --
-- Press jk fast to enter
-- keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope mapping
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>ff", "<cmd>Telescope fd<cr>", opts)
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
keymap.set("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
-- keymap.set('n', '<leader>fl', "<cmd>Telescope marks<cr>", opts)
-- -- Code Action using Custom scripts
-- keymap.set('n', '<leader>ca', ":lua require('utils').scripts.ShowCodeAction()<CR>", opts)
-- Telescope mapping (Extra)
keymap.set("n", "<leader>flf", ":lua require('utils').telefilter.lsp_document_symbols_filtered()<CR>", opts)
keymap.set("n", "<leader>fla", ":lua require('utils').telefilter.lsp_document_symbols_all()<CR>", opts)
keymap.set("n", "<leader>te", "<cmd>:tab terminal<cr>", opts)

-- enable cursor culomn
keymap.set("n", "<leader>ac", "<cmd>:set cursorcolumn<cr>", opts)

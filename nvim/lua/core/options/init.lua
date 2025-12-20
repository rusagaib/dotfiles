local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                       -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  -- cursorcolumn = true,                     -- highlight the current column 
  number = true,                           -- set numbered lines
  laststatus = 3,
  showcmd = true,
  ruler = true,
  relativenumber = true,                   -- set relative numbered lines
  --numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                            -- display lines as one long line
  -- scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 5,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  title = true,
  -- colorcolumn = "80",
  -- colorcolumn = "120",

  -- Prevent automatic folding
  foldenable = true,                    -- Disable folding by default
  foldcolumn = "1",                         -- '0' is not bad
  foldlevel = 99,                           -- Start unfolded
  foldlevelstart = 99,                      -- Ensure all folds are open when starting
  foldmethod = "expr",                   -- Use manual folding to avoid auto-folding, "expr", "manual"

  -- new vim opt winborder
  winborder = 'rounded',
}

--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 0
--vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
--vim.opt.fillchars = vim.opt.fillchars + "vertright: "

vim.opt.termguicolors = true
vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
--
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}

-- netrw style hidden banner (still can show it by pres I)
vim.cmd "let g:netrw_banner = 0"
-- netrw_liststyle tree view
-- vim.cmd "let g:netrw_liststyle = 3"
-- netrw_liststyle default
vim.cmd "let g:netrw_liststyle = 0"

-- Function to display filenames in the tabline with a black circle for the active tab
-- and a white circle for the inactive tabs.
function _G.custom_tabline()
  local s = ''
  local active_symbol = "»"
  local inactive_symbol = ""
  local modified_symbol = "●"

  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local filename = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    local tabnr = vim.fn.tabpagenr()

    -- Check if the buffer is modified and append the 'M' symbol if so
    if vim.bo[bufnr].modified then
      filename = filename .. ' ' .. modified_symbol
      -- filename = filename .. ' ' .. modified_symbol
    end

    -- Highlight the current tab with a black circle and others with a white circle
    if i == tabnr then
      s = s .. '%' .. i .. 'T' .. '%#TabLineSel# ' .. active_symbol .. ' ' .. filename .. ' %#TabLine#'
    else
      s = s .. '%' .. i .. 'T' .. inactive_symbol .. ' ' .. filename .. ' '
    end
  end

  -- Add a new tab button with the inactive symbol
  s = s .. '%#TabLineFill#%T%#TabLine#'

  return s
end

-- Set the custom tabline
vim.opt.tabline = '%!v:lua.custom_tabline()'

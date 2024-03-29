local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   'nvim-lua/popup.nvim',
   'nvim-lua/plenary.nvim',
    -- color-schemes
   'EdenEast/nightfox.nvim',
   'rebelot/kanagawa.nvim',
   {'catppuccin/nvim', name = 'catppuccin'},

  -- Lazy loading:
  -- Load on specific commands
   {'tpope/vim-dispatch', lazy = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the 'config' key)
   {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = function() vim.cmd[[ALEEnable]] end
   },

  -- Plugins can have dependencies on other plugins
   {
    'haorenW1025/completion-nvim',
    lazy = true,
    dependencies = {
      {'hrsh7th/vim-vsnip', lazy = true},
      {'hrsh7th/vim-vsnip-integ', lazy = true}
    }
  },

  -- Plugins can have post-install/update hooks


  -- Post-install/update hook with neovim command
   { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Post-install/update hook with call of vimscript function with argument
   { 'glacambre/firenvim', build = function() vim.fn['firenvim#install'](0) end },

  --  dependency and run lua function after load
   {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  },

  --  markdown previer
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  },

  --  telescope
   {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'}, {'kdheepak/lazygit.nvim'} },
  },

  -- clipboard manager
   'AckslD/nvim-neoclip.lua',

  --auto complete

   'saadparwaiz1/cmp_luasnip',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/cmp-nvim-lua',

   {
    'hrsh7th/nvim-cmp',
    config = function () require('cmp-config') end,
    dependencies = {
      'L3MON4D3/LuaSnip',        --d in config
      'onsails/lspkind.nvim',    --d in config
    },
    -- after = 'LuaSnip',
  },

  --snippet luasnip
   { "rafamadriz/friendly-snippets" },

   {
    'L3MON4D3/LuaSnip',
    --after = 'nvim-cmp',
    -- follow latest release.
    version = "v1.2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    -- config = function () require('luasnip-config') end,
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
   },

--  LSP-Installer (MASON)
   {
      'williamboman/mason.nvim',
      build = ":MasonUpdate"
   },
   {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
   },

  -- glance (frontend dev)
   { "dnlhc/glance.nvim" },

  -- devicons
   { 'nvim-tree/nvim-web-devicons', lazy = true },

  --  lualine (status line)
   {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true }
   },

  -- adding float term for lazygit 
   'voldikss/vim-floaterm',

  -- adding swagger-preview
   'rusagaib/oas-preview.nvim',
}

local opts = {}

require('lazy').setup(plugins, opts)


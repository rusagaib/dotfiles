-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- color-schemes
  use { 'EdenEast/nightfox.nvim' }
  use { 'rebelot/kanagawa.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- Plugins can have post-install/update hooks


  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- use markdown previer
  -- use {'iamcco/markdown-preview.nvim'}
 -- use({
 --   "iamcco/markdown-preview.nvim",
 --   run = function() vim.fn["mkdp#util#install"]() end,
 -- })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- use telescope
  use {
    'nvim-telescope/telescope.nvim', 
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim', 
    'nvim-telescope/telescope-media-files.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "AckslD/nvim-neoclip.lua" }

  --lsp
--  use {
--    'williamboman/nvim-lsp-installer',  
--    'neovim/nvim-lspconfig',
--  }

  --auto complete
  use {
    'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lua'
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function () require("cmp-config") end,
    requires = {
      {'L3MON4D3/LuaSnip'},        --used in config
      {'onsails/lspkind.nvim'},    --used in config
    },
    --after = 'LuaSnip',
  }

  --snippet luasnip
  use {
    'L3MON4D3/LuaSnip',
    --after = 'nvim-cmp',
    config = function () require("luasnip-config") end,
    requires = {'rafamadriz/friendly-snippets'},
  }

-- use { 'williamboman/nvim-lsp-installer' } --used for lang-server 
--  use {
--      "williamboman/nvim-lsp-installer",
--      {
--          "neovim/nvim-lspconfig",
--          config = function()
--              require("nvim-lsp-installer").setup {}
--              local lspconfig = require("lspconfig")
--              lspconfig.sumneko_lua.setup {}
--          end
--      }
--  }

-- use LSP-Installer (MASON)
--  use { "williamboman/mason.nvim" }
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  use { 'kyazdani42/nvim-web-devicons' }

  -- use lualine (status line)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- adding swagger-preview
  use { "rusagaib/oas-preview.nvim" }

end)

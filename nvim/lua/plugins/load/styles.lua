return {
   {'catppuccin/nvim', name = 'catppuccin'},
   {'EdenEast/nightfox.nvim', name = 'nightfox'},
   {'rebelot/kanagawa.nvim', name = 'kanagawa'},
  -- devicons
   { 'nvim-tree/nvim-web-devicons', lazy = true },

  --  lualine (status line)
   {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true }
   },

}

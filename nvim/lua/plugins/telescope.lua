return {
  -- Telescope plugin
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-x>"] = actions.delete_buffer + actions.move_to_top, -- Delete buffers in insert mode
              },
              n = {
                ["<C-x>"] = actions.delete_buffer + actions.move_to_top, -- Delete buffers in normal mode
              },
            },
          },
        },
      })
    end
  },
  {
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'}, {'kdheepak/lazygit.nvim'} },
  },
}


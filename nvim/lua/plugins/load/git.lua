return {
   {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    -- config = function()
    --   local ok, gitsigns = pcall(require, 'gitsigns')
    --   if not ok then return end  -- Cegah error jika gitsigns tidak bisa dipanggil
    --
    --   -- Cek apakah direktori adalah repo Git dengan cara lain
    --   local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
    --   local git_inside = handle:read("*a")
    --   handle:close()
    --
    --   if git_inside:match("true") then
    --     gitsigns.setup()
    --   else
    --     vim.notify("Gitsigns: No Git repository found", vim.log.levels.WARN)
    --   end
    -- end
    -- config = function()
    -- local ok, gitsigns = pcall(require, 'gitsigns')
      -- if ok then
      --   gitsigns.setup()
      -- end
    -- end
    config = function()
      require('gitsigns').setup()
    end
    }
}

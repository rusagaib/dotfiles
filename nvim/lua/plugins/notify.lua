return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      -- Ensure code action notifications are handled
      -- notify = function(_, opts)
      --   if opts.title and opts.title:match("LSP") then
      --     -- Customize as needed
      --     return true
      --   end
      --   return true
      -- end,
    })
  end,
}


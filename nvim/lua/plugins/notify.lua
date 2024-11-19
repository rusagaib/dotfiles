return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      -- Ensure code action notifications are handled
      -- notify = function(_, opts)
      notify = function(msg, opts)
        if msg == "No information available" then
          return
        end
        require("notify").notify(msg, opts)
      end,
    })
  end,
}


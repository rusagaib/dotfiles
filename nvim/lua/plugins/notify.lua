return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      -- stages = "static",
			-- render = "compact",
    })
  end,
}

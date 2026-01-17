return {
  "oysandvik94/curl.nvim",
  cmd = { "CurlOpen" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("curl").setup({
      -- Table of strings to specify default headers to be included in each request, i.e. "-i"
      default_flags = {},
      -- Specify an alternative curl binary that will be used to run curl commands
      -- String of either full path, or binary in path
      curl_binary = nil,
      -- Print elapsed time in seconds if request duration exceeds this limit or don't if nil
      show_request_duration_limit = nil,
      -- Specify how to open curl
      -- use "tab" to open in separate tab
      -- use "split" to open in horizontal split
      -- use "vsplit" to open in vertical split
      -- use "buffer" to open in new buffer
      open_with = "tab",
      -- Specify how to split the output buffer (when open_with is not "tab")
      -- use "vertical" for vertical split (default)
      -- use "horizontal" for horizontal split
      output_split_direction = "vertical",
      mappings = {
        execute_curl = "<CR>"
      }
    })
  end,
}

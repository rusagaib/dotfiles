local M = {}

-- notify-nvim show notification to save/writes some file
M.NotifySave = function()
  require('notify')("Save or Write changes of files using key: <leader>S", "warn", { title = "keymap" })
end

-- open URL under cursor in default browser
M.OpenUrl = function()
  local url = vim.fn.expand('<cWORD>')  -- Get the word under the cursor

  -- Simple pattern to check if it's a URL (http or https)
  if string.match(url, "^https?://") then
    -- Open the URL in the default browser
    -- vim.fn.jobstart({"xdg-open", url}, {detach = true})  -- Linux (using xdg-open)
    -- vim.fn.jobstart({"open", url}, {detach = true})  -- macOS (using open)
    -- vim.fn.jobstart({"start", url}, {detach = true})  -- Windows (using start)
    vim.fn.jobstart({"wslview", url}, {detach = true})  -- Windows (wsl2) "sudo apt install wslu"
  else
    -- Notify if the word under the cursor is not a valid URL
    require('notify')("No valid URL under cursor!", "error", { title = "Error" })
  end
end

return M

local M = {}

-- notify-nvim show notification to save/writes some file
M.NotifySave = function()
  require('notify')("Save or Write changes of files using key: <leader>S", "warn", { title = "keymap" })
end

-- notify for saved/writed file
M.NotifySaved = function()
  local buf = vim.api.nvim_get_current_buf()  -- Get the current buffer number
  local file_path = vim.api.nvim_buf_get_name(buf)  -- Get the file name with path
  -- Trigger the notification
  require('notify')(string.format("Saved %s", file_path), "info", { title = "Saved" })
  -- Save the file
  vim.cmd('write')
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

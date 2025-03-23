local M = {}

-- notify-nvim show notification to save/writes some file
M.NotifySave = function()
	require("notify")("Save or Write changes of files using key: <leader>S", "warn", { title = "keymap" })
	-- test
end

-- notify for saved/writed file
M.NotifySaved = function()
	local buf = vim.api.nvim_get_current_buf() -- Get the current buffer number
	local file_path = vim.api.nvim_buf_get_name(buf) -- Get the file name with path
	-- Trigger the notification
	require("notify")(string.format("Saved %s", file_path), "info", { title = "Saved" })
	-- Save the file
	vim.cmd("write")
end

-- find and replace word with escaped symbols
-- same as using v-line block line -> : -> s/\query/\g -> enter
M.FNReplaceWords = function(query, new_word)
	-- Get the current visual selection range
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	-- Escape special characters for Vim regex
	local escaped_query = vim.fn.escape(query, "\\/")
	local escaped_new_word = vim.fn.escape(new_word, "\\")

	-- Construct the substitution command without word boundaries
	local command = string.format("%d,%ds/%s/%s/g", start_line, end_line, escaped_query, escaped_new_word)

	-- Print the command for debugging
	-- print("Running command:", command)

	-- Perform the substitution
	vim.cmd(command)

	-- Display a notification using Noice
	local message = string.format("Replaced '%s' with '%s' from line %d to %d", query, new_word, start_line, end_line)
	require("notify")(message, "info", { title = "Replace Command" })
end

-- open URL under cursor in default browser
M.OpenUrl = function()
	local url = vim.fn.expand("<cWORD>") -- Get the word under the cursor

	-- Simple pattern to check if it's a URL (http or https)
	if string.match(url, "^https?://") then
		-- Open the URL in the default browser
		-- vim.fn.jobstart({"xdg-open", url}, {detach = true})  -- Linux (using xdg-open)
		-- vim.fn.jobstart({"open", url}, {detach = true})  -- macOS (using open)
		-- vim.fn.jobstart({"start", url}, {detach = true})  -- Windows (using start)
		vim.fn.jobstart({ "wslview", url }, { detach = true }) -- Windows (wsl2) "sudo apt install wslu"
	else
		-- Notify if the word under the cursor is not a valid URL
		require("notify")("No valid URL under cursor!", "error", { title = "Error" })
	end
end

M.ToggleEmmetLs = function()
	local clients = vim.lsp.get_active_clients()
	local emmet_ls_running = false

	for _, client in pairs(clients) do
		if client.name == "emmet_ls" then
			emmet_ls_running = true
			break
		end
	end

	if emmet_ls_running then
		for _, client in pairs(clients) do
			if client.name == "emmet_ls" then
				vim.lsp.stop_client(client.id)
				require("notify")("emmet_ls stopped!", "warn", { title = "Lsp" })
				break
			end
		end
	else
		vim.cmd("LspStart emmet_ls")
		require("notify")("emmet_ls started!", "info", { title = "Lsp" })
	end
end

-- M.ShowCodeAction = function()
--   local noice = require('noice')
--   vim.lsp.buf.code_action({
--     callback = function(actions)
--       if actions and #actions > 0 then
--         -- Customize how you want to display actions with noice
--         noice.notify({
--           title = 'Code Actions',
--           message = table.concat(vim.tbl_map(function(action)
--             return action.title
--           end, actions), '\n'),
--           level = 'info',  -- You can use 'warn' or 'error' depending on your preference
--         })
--       else
--         noice.notify({
--           title = 'No Code Actions',
--           message = 'No available code actions for the current cursor position.',
--           level = 'info',
--         })
--       end
--     end
--   })
-- end

return M

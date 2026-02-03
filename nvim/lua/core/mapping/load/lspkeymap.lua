local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
		-- keymap.set("n", "gr", vim.lsp.buf.references, opts)
		opts.desc = "Show LSP definition"
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		opts.desc = "Show LSP implementation"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		opts.desc = "Show LSP implementation"
		keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		-- keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, opts)
		-- keymap.set("n", "<A-p>", vim.diagnostic.goto_next, opts)
		-- keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
		-- keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
		opts.desc = "Rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		opts.desc = "Hover"
		keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
		keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})

-- -- vim.lsp.inlay_hint.enable(true)
-- local severity = vim.diagnostic.severity
--
-- vim.diagnostic.config({
--   signs = {
--     text = {
--       [severity.ERROR] = " ",
--       [severity.WARN] = " ",
--       [severity.HINT] = "󰠠 ",
--       [severity.INFO] = " ",
--     },
--   },
-- })

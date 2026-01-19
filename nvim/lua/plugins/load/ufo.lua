return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		-- Require the ufo plugin
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" } -- Use LSP and indent for fold management
			end,
		})

		-- Key mappings for ufo.nvim
		vim.keymap.set("n", "zR", require("ufo").openAllFolds) -- Open all folds
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds) -- Close all folds
		-- vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds) -- Open folds except specific kinds
		-- vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)     -- Close folds based on fold level
		vim.keymap.set("n", "zK", function()
			local windid = require("ufo").peekFoldedLinesUnderCursor()
			if not windid then
				-- vim.lsp.buf.hover()
			end
		end, { desc = "Peek Fold" })

		-- Persist fold state after entering Normal mode from Insert mode
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWinEnter", "WinEnter" }, {
		-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
			pattern = "*",
			callback = function()
				vim.opt.foldenable = true -- Keep folding enabled when switching modes
				vim.opt.foldlevel = 99 -- Ensure folds remain open
				vim.opt.foldmethod = "expr" -- Keep fold method as 'expr' (or 'manual')
			end,
		})

		-- end of config(
	end,
}

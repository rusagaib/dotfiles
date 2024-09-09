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

		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Key mappings for ufo.nvim
		vim.keymap.set("n", "zR", require("ufo").openAllFolds) -- Open all folds
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds) -- Close all folds
		-- vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds) -- Open folds except specific kinds
		-- vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)     -- Close folds based on fold level
		vim.keymap.set("n", "zK", function()
			local windid = require("ufo").peekFoldedLinesUnderCursor()
			if not windid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek Fold" })

		-- end of config(
	end,
}

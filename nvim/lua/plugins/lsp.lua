return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"html",
					"tailwindcss",
					"emmet_ls",
					"marksman",
					"tsserver", -- ts
					"intelephense", -- php lsp
					"pyright", -- python lsp
					"gopls", -- go lsp
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
			-- lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"sass",
					"scss",
					"php",
					"vue",
          "yaml",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})

			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.marksman.setup({})

			-- lsp tailwindcss
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- lsp lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- lsp javascript & typescript (vue,svelte)
			lspconfig.tsserver.setup({
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
							languages = { "typescript", "javascript", "vue" },
						},
						{
							name = "typescript-svelte-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
							languages = { "typescript", "javascript", "svelte" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- lsp php intelephense
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
				root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
				flags = {
					debounce_text_changes = 150,
				},
				settings = {
					intelephense = {
						files = {
							associations = { "*.php", "*.phtml", "*.module", "*.inc" },
              maxSize = 1000000,
						},
					},
				},
				-- aklsdjfkasdjf
				-- on_attach = function(client)
				-- client.server_capabilities.documentFormattingProvider = true
				-- end,
				-- settings = {
				-- intelephense = {
				-- files = {
				-- associations = { "*.php", "*.phtml", "*.module", "*.inc" }
				-- }
				-- }
				-- }
			})

			-- lsp python
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- lsp go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- lsp yaml
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			local opts = { noremap = true, silent = true }

			-- lsp.buf (navigation code structure)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

			-- code actions
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			-- diagnostic
			vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<A-p>", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

			-- workspace
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
		end,
	},
}

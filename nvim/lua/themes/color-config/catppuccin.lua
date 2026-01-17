require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- background = { -- :h background
	--     light = "latte",
	--     dark = "mocha",
	-- },
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		-- -- Syntax groups
		-- Function = '#E57373',   -- Customize the color for function names
		-- Keyword = '#E57373',    -- Customize the color for keywords
		-- Type = '#E57373',       -- Customize the color for types
		Statement = { fg = "#E57373", bold = true }, -- Customize the color for statements
		-- Special = '#E57373',    -- Customize the color for special elements
		--
		-- -- UI elements
		-- CursorLineNr = '#E57373', -- Line number of the current line
		-- PmenuSel = { bg = '#E57373', fg = '#000000' },  -- Popup menu selection
		-- Search = { bg = '#E57373', fg = '#000000' },    -- Search highlights
		-- IncSearch = { bg = '#E57373', fg = '#000000' }, -- Incremental search highlights
		-- Visual = { bg = '#E57373', fg = '#000000' },    -- Visual selection
	},
	highlights = {
		enable = true,
	},
	custom_highlights = {
		-- Define your custom highlight groups
		Function = { fg = "#E57373", bold = true }, -- Example: Custom color for functions
		Keyword = { fg = "#E57373", italic = true }, -- Example: Custom color for keywords
		Type = { fg = "#E57373", bold = true }, -- Example: Custom color for types
		Statement = { fg = "#E57373", bold = true }, -- Example: Custom color for statements like `return`
		Special = { fg = "#E57373", bold = true }, -- Example: Custom color for special elements

		-- Optionally, customize UI elements as well
		CursorLineNr = { fg = "#E57373", bold = true }, -- Line number of the current line
		PmenuSel = { bg = "#E57373", fg = "#000000" }, -- Popup menu selection
		Search = { bg = "#E57373", fg = "#000000" }, -- Search highlights
		IncSearch = { bg = "#E57373", fg = "#000000" }, -- Incremental search highlights
		Visual = { bg = "#E57373", fg = "#000000" }, -- Visual selection
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = true,
		mason = true,
		noice = true,
		-- mini = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Keyword", { fg = pastel_red, bold = true }) -- Adjust as needed
		vim.api.nvim_set_hl(0, "Statement", { fg = pastel_red, bold = true }) -- Adjust as needed
		vim.api.nvim_set_hl(0, "Keyword", { fg = pastel_red, bold = true }) --
	end,
})

-- -- Define your pastel red color
-- local pastel_red = '#E57373'
--
--
-- -- Apply the pastel red color to classes
-- vim.api.nvim_set_hl(0, 'Type', { fg = pastel_red, bold = true })    -- For class names
-- vim.api.nvim_set_hl(0, 'Class', { fg = pastel_red, bold = true })
--
-- -- Override specific syntax groups with hardcoded Kanagawa Dragon colors
-- -- vim.api.nvim_set_hl(0, 'Comment', { fg = '#7E9CD8', italic = true }) -- Example color
-- -- vim.api.nvim_set_hl(0, 'Keyword', { fg = '#72575D', bold = true })
-- vim.api.nvim_set_hl(0, 'Keyword', { fg = '#C9BBCF', bold = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#F2D7D9", bold = true })
vim.api.nvim_set_hl(0, "String", { fg = "#C9BBCF" })
vim.api.nvim_set_hl(0, "Conditionals", { fg = "#C9BBCF" })

-- Define your pastel red color for accents
local pastel_red = "#E57373"

vim.api.nvim_set_hl(0, "TSKeyword", { fg = pastel_red, bold = true }) -- Example: For keywords
vim.api.nvim_set_hl(0, "TSKeywordFunction", { fg = pastel_red, bold = true }) -- Example: For function-related keywords

-- Override specific syntax groups to use the pastel red accent color
vim.api.nvim_set_hl(0, "Keyword", { fg = pastel_red, bold = true }) -- Keywords (e.g., if, else, return)
-- vim.api.nvim_set_hl(0, 'Function', { fg = pastel_red, bold = true })   -- Function names
vim.api.nvim_set_hl(0, "Type", { fg = pastel_red, bold = true }) -- Types (e.g., int, char, class)
vim.api.nvim_set_hl(0, "Statement", { fg = pastel_red, bold = true }) -- Statements (e.g., for, while, switch)

-- Override UI elements to use the pastel red accent color
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = pastel_red, bold = true }) -- Line number of the current line
vim.api.nvim_set_hl(0, "PmenuSel", { bg = pastel_red, fg = "#000000" }) -- Popup menu selection
-- vim.api.nvim_set_hl(0, 'Search', { bg = pastel_red, fg = '#000000' })    -- Search highlights
vim.api.nvim_set_hl(0, "IncSearch", { bg = pastel_red, fg = "#000000" }) -- Incremental search highlights
-- vim.api.nvim_set_hl(0, 'Visual', { bg = pastel_red, fg = '#000000' })    -- Visual selection

-- Customize other UI components with pastel red if desired
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = pastel_red }) -- Diagnostic errors
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = pastel_red })

vim.api.nvim_set_hl(0, "Special", { fg = pastel_red, bold = true }) -- For special elements like anonymous functions or lambdas

-- Optionally, apply pastel red to lambda functions if identified as a specific group
-- For example, if the group is `Identifier`:
vim.api.nvim_set_hl(0, "Identifier", { fg = pastel_red, bold = true }) -- If this group applies
vim.api.nvim_set_hl(0, "Statement", { fg = pastel_red, bold = true }) -- For statements like `return`

-- vim.cmd [[
-- highlight DiagnosticErrorBackground guibg=none guifg=none
-- highlight DiagnosticWarnBackground guibg=none guifg=none
-- highlight DiagnosticInfoBackground guibg=none guifg=none
-- highlight DiagnosticHintBackground guibg=none guifg=none
-- ]]

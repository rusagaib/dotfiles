-- ./lua/utils/tele-filter.lua
local M = {}

-- Define a custom function to filter out variables
-- using Telescope ui lsp_document_symbols
-- keymaps on ./lua/mapping/init.lua ? Telescope mapping
-- display fillterd section
M.lsp_document_symbols_filtered = function()
    require('telescope.builtin').lsp_document_symbols({
        symbols = {
            "function",
            "method",
            "class",
            -- "constructor",
            -- "interface",
            -- "enum",
            -- "module",
            -- "property",
            -- "field",
            -- "event",
            -- "namespace",
            -- "type",
            -- "parameter",
            -- "variable",
        },
    })
end

-- display all section
M.lsp_document_symbols_all = function()
    require('telescope.builtin').lsp_document_symbols({
        symbols = {
            "function",
            "method",
            "class",
            "constructor",
            "interface",
            "enum",
            "module",
            "property",
            "field",
            "event",
            "namespace",
            "type",
            "parameter",
            "variable",
            "String",
        },
    })
end

return M

-- ./lua/utils/tele-filter.lua
local M = {}

-- Define a custom function to filter out variables
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

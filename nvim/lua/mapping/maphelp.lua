-- Create a custom command to print all key mappings
vim.api.nvim_create_user_command('ShowKeymaps', function()
    -- Print normal mode mappings
    print("Normal mode mappings:")
    vim.cmd('nmap')

    -- Print visual mode mappings
    print("Visual mode mappings:")
    vim.cmd('vmap')

    -- Print insert mode mappings
    print("Insert mode mappings:")
    vim.cmd('imap')

    -- Print command-line mode mappings
    print("Command-line mode mappings:")
    vim.cmd('cmap')

    -- Print operator-pending mode mappings
    print("Operator-pending mode mappings:")
    vim.cmd('omap')

    -- Print terminal mode mappings
    print("Terminal mode mappings:")
    vim.cmd('tmap')
end, {})

-- You can now use :ShowKeymaps to print all key mappings

-- Basic key to move around: 
-- [{ = move to open brackets
-- ]} = move to closed brackets
-- f<key-word> = find word inline 
-- navigate ; = next
-- navigate , = previous
-- files search /<key-word> or ?<key-word> = find <key-word> 
-- navigate n = next
-- navigate N = previous

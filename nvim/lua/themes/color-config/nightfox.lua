require('nightfox').setup({
  options = {
    transparent = true,
    terminal_colors = true
  }
})

vim.cmd("colorscheme nightfox")

-- vim.cmd [[
-- highlight DiagnosticErrorBackground guibg=none guifg=none
-- highlight DiagnosticWarnBackground guibg=none guifg=none
-- highlight DiagnosticInfoBackground guibg=none guifg=none
-- highlight DiagnosticHintBackground guibg=none guifg=none
-- ]]

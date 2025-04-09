return {
    'uga-rosa/ccc.nvim',
    config = function ()
      require("ccc").setup({
        lsp = false, -- Menampilkan warna dalam hover LSP
        highlighter = {
          auto_enable = true, -- Highlight warna secara otomatis
        },
      })
    end
}

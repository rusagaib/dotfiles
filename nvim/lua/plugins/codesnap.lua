return {
  -- sudo apt-get install build-essential
  -- sudo apt-get install clang libclang-dev
  -- install rust:
  -- curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  config = function ()
    require('codesnap').setup({
      watermark = "",
      opts = {
        save_path = "~/Pictures",
        has_breadcrumbs = true,
        bg_theme = "bamboo",
      },
    })
  end
}

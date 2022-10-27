local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "css" }, -- list langs to disabled
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python", "css", "yaml" }
  },
}

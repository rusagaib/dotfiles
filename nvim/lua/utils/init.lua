local M = {}

M.setup = function()
  M.scripts = require('utils.scripts')
  M.telefilter = require('utils.tele-filter')
  M.laravelutls = require('utils.laravelutls')
end

return M

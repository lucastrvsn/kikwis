-- TODO(lucastrvsn): Maybe all this code can be a plugin
-- to create vim colorschemes. Needs some polish.

local M = {}

M.setup = function(opts)
  opts = opts or {}

  local palette = opts.palette or 'lopsa'
  local colors = require('kikwis/colors')(palette)
  local theme = require('kikwis/theme')(colors)

  for _, v in ipairs(theme) do
    vim.cmd(v)
  end
end

return M

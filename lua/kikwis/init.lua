-- TODO(lucastrvsn): Maybe all this code can be a plugin
-- to create vim colorschemes. Needs some polish.

local M = {}

M.setup = function(opts)
  opts = opts or {}

  local palette = opts.palette or 'lopsa'
  local colors = require('kikwis/colors')(palette)
  local theme = require('kikwis/theme')(colors)
  M.namespace = vim.api.nvim_create_namespace('kikwis')

  for _, v in ipairs(theme) do
    vim.api.nvim_set_hl(M.namespace, v.group, v.opts)
  end

  vim.api.nvim__set_hl_ns(M.namespace);

  return namespace
end

return M

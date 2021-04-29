local M = {}

-- cache to all highlights created
M._highlights = {}

local get_attributes_from_cache = function(group)
  assert(type(group) == 'string', 'Group needs to be a string.')

  local cached = M._highlights[group]

  assert(cached ~= nil, 'Group [' .. group .. '] does not exists.')

  return cached
end

local get_attributes_from_group = function(group)
  local hlID = vim.fn['hlID'](group)
  local synIDtrans = vim.fn['synIDtrans'](hlID)

  local fg = vim.fn['synIDattr'](synIDtrans, 'fg#')
  local bg = vim.fn['synIDattr'](synIDtrans, 'bg#')
  local gui = vim.fn['synIDattr'](synIDtrans, 'gui')

  if (fg == '') then
    fg = nil
  end

  if (bg == '') then
    bg = nil
  end

  if (gui == '') then
    gui = nil
  end

  return {
    fg = fg,
    bg = bg,
    gui = gui
  }
end

local create_highlight = function(group, opts)
  local fg = opts.fg or nil
  local bg = opts.bg or nil
  local bold = opts.bold or nil
  local standout = opts.standout or nil
  local underline = opts.underline or nil
  local undercurl = opts.undercurl or nil
  local italic = opts.italic or nil
  local reverse = opts.reverse or nil
  local default = opts.default or nil
  local global = opts.global or nil

  M._highlights[group] = opts

  return {
    group = group,
    opts = {
      fg = opts.fg or nil,
      bg = opts.bg or nil,
      bold = opts.bold or false,
      standout = opts.standout or false,
      underline = opts.underline or false,
      undercurl = opts.undercurl or false,
      italic = opts.italic or false,
      -- TODO: How this even work?
      -- reverse = opts.reverse or false,
      default = opts.default or false,
      global = opts.global or false
    }
  }
end

local create_highlight_link = function(group, link, opts)
  if type(opts) == 'table' then
    local attrs = get_attributes_from_cache(link)

    return create_highlight(group, attrs)
  end

  M._highlights[group] = link

  return {
    group = group,
    opts = {
      link = link
    }
  }
end

M.highlight = function(...)
  local args = {...}
  local highlight

  assert(type(args[1]) == 'string')

  -- if args[2] is a string, we are linking or extending another highlight
  -- if args[2] is a table, just create a highlight group
  -- TODO: need a default value from empty
  if type(args[2]) == 'string' then
    highlight = create_highlight_link(args[1], args[2], args[3])
  elseif type(args[2]) == 'table' then
    highlight = create_highlight(args[1], args[2])
  end

  return highlight
end

return M

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
  local fg = opts.fg or 'NONE'
  local bg = opts.bg or 'NONE'
  local gui = opts.gui or 'NONE'

  M._highlights[group] = opts

  return string.format(
    'highlight %s guifg=%s guibg=%s gui=%s',
    group,
    fg,
    bg,
    gui
  )
end

local create_highlight_link = function(group, link, opts)
  if type(opts) == 'table' then
    local attrs = get_attributes_from_cache(link)

    return create_highlight(group, attrs)
  end

  M._highlights[group] = link

  return string.format(
    'highlight! link %s %s',
    group,
    link
  )
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

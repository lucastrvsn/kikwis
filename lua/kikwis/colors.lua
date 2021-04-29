local hsl = require('kikwis/hsl')

local lopsa = {
  gray0   = hsl(6, 3, 15), -- #272525
  gray1   = hsl(4, 4, 21), -- #383433
  gray2   = hsl(4, 5, 26), -- #463f3f
  gray3   = hsl(6, 5, 31), -- #534c4b
  gray4   = hsl(6, 5, 36), -- #605857
  gray5   = hsl(8, 5, 42), -- #706766
  gray6   = hsl(8, 7, 47), -- #80726f
  gray7   = hsl(8, 7, 52), -- #8d7e7c
  gray8   = hsl(10, 7, 58), -- #9b8f8c
  gray9   = hsl(10, 7, 64), -- #aa9f9d
  white   = hsl(38, 47, 73), -- #dbc39a
  green   = hsl(83, 36, 53), -- #91b25c
  tea     = hsl(112, 29, 59), -- #80b578
  red     = hsl(358, 65, 64), -- #df686c
  salmon  = hsl(12, 74, 66), -- #e88268
  yellow  = hsl(40, 70, 62), -- #e2b55a
  orange  = hsl(28, 74, 63), -- #e69c5b
  blue    = hsl(192, 31, 58), -- #73a8b5
  magenta = hsl(346, 42, 66) -- #cb8495
}

local machi = {
  gray0   = hsl(16, 11, 16),
  gray1   = hsl(4, 5, 21),
  gray2   = hsl(8, 5, 28),
  gray3   = hsl(8, 5, 30),
  gray4   = hsl(12, 4, 34),
  gray5   = hsl(12, 4, 39),
  gray6   = hsl(12, 4, 43),
  gray7   = hsl(14, 4, 48),
  gray8   = hsl(14, 4, 58),
  white   = hsl(38, 49, 72),
  green   = hsl(72, 39, 55),
  teal    = hsl(137, 29, 56),
  red     = hsl(358, 65, 64),
  salmon  = hsl(12, 74, 66),
  yellow  = hsl(40, 70, 62),
  orange  = hsl(25, 79, 65),
  blue    = hsl(192, 31, 58),
  magenta = hsl(346, 48, 69)
}

local palettes = {
  lopsa = lopsa,
  machi = machi
}

return function(palette)
  assert(type(palette) == 'string')

  local p = palettes[palette]

  if p ~= nil then
    return p
  end

  return palettes['lopsa']
end

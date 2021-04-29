local round = function(value)
  return math.floor(value + 0.5)
end

-- https://github.com/luapower/color/blob/master/color.lua#L42-L54
local h2rgb = function(m1, m2, h)
  if h < 0 then
    h = h + 1
  end

  if h > 1 then
    h = h - 1
  end

  if h * 6 < 1 then
    return m1 + (m2 - m1) * h * 6
  elseif h * 2 < 1 then
    return m2
  elseif h * 3 < 2 then
    return m1 + (m2 - m1) * (2 / 3 - h) * 6
  end

  return m1
end

-- https://github.com/luapower/color/blob/master/color.lua#L55-L63
local hsl_to_rgb = function(h, s, L)
  h = h / 360
  s = s / 100
  L = L / 100

  local m2 = L <= 0.5 and L * (s + 1) or L + s - L * s
  local m1 = L * 2 - m2

  return
    round(h2rgb(m1, m2, h + 1 / 3) * 255),
    round(h2rgb(m1, m2, h) * 255),
    round(h2rgb(m1, m2, h - 1 / 3) * 255)
end

local rgb_to_hex = function(r, g, b)
  return string.format('#%02x%02x%02x', r, g, b)
end

return setmetatable({}, {
  __call = function(self, h, s, l)
    local r, g, b = hsl_to_rgb(h, s, l)
    return rgb_to_hex(r, g, b)
  end
})

local wezterm = require("wezterm")

-- 定义可用的颜色方案列表
local color_schemes = {
    "Batman",          -- 星期日
    "Bamboo",         -- 星期一
    "AdventureTime",          -- 星期二
    "Blazer",          -- 星期三
    "Borland",         -- 星期四
    "Red Sands",    -- 星期五
    "Dracula", -- 星期六
  }

-- -- 获取所有内置颜色主题名称
-- local schemes = wezterm.get_builtin_color_schemes()
-- local color_schemes = {}

-- for name, _ in pairs(schemes) do
--   table.insert(color_schemes, string.format('"%s"', name))
-- end

-- local color_schemes = wezterm.get_builtin_color_schemes()

-- 随机选择颜色方案
local function get_scheme_random()
  local index = math.random(1, #color_schemes)
  return color_schemes[index]
end

-- 获取当前星期几
local function get_scheme_by_weekday()
  -- os.date("%w") 返回数字：0（星期日）到 6（星期六）
  local weekday = tonumber(os.date("%w")) -- Lua数组从1开始，调整索引
  print("today is " .. weekday .. " of 7" )
  return color_schemes[weekday + 1]
end




return {
    color_schemes = color_schemes,
    get_scheme_random = get_scheme_random,
    get_scheme_by_weekday = get_scheme_by_weekday
}
-- Pull in the wezterm API
local wezterm = require 'wezterm'


-- local wezterm = require 'wezterm'


-- This table will hold the configuration.
local config = {}

-- require("")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local Config = require("config")

local color = require("config.color")

-- 初始化随机数种子
math.randomseed(os.time())

local time_gap = 5 -- 5s update
-- local time_gap = 60 -- 5s update


-- -- 当前颜色方案变量
-- local current_scheme = get_random_color_scheme()


local last_update_time = os.time()

local time_func = function(window, pane)
  local now = os.time()

  local current_scheme = window:effective_config().color_scheme or "Default"
  local font = window:effective_config().font.font[1].family

  -- 更新状态栏内容
  window:set_right_status(wezterm.format({
    -- { Text = "Color Scheme: " .. current_scheme .. "  " ..  "Font: " .. font .. " Time: " .. os.date("%X")},
    { Text = "Color Scheme: " .. current_scheme .. " | Font: " .. font .. " | Time: " .. os.date("%X") .. " | Day: " .. tonumber(os.date("%w")) .. " of 7"},
  }))

  -- 仅在上次更新 5 秒后执行
  -- now == last_update_time or
  if  now - last_update_time >= time_gap then
    last_update_time = now

    -- 打印日志，方便调试
    print("状态栏更新于", os.date("%X"))

    -- local new_scheme = color.get_scheme_random()
    local new_scheme = color.get_scheme_by_weekday()
    local config_overrides = window:get_config_overrides() or {}
    config_overrides.color_scheme = new_scheme

    local font = window:effective_config().font.font[1].family

    print(font)
    window:set_config_overrides(config_overrides)

    local current_scheme = window:effective_config().color_scheme or "Default"
    print(current_scheme)


    -- 更新状态栏内容
    window:set_right_status(wezterm.format({
      -- { Text = "Color Scheme: " .. current_scheme .. "  " ..  "Font: " .. font .. " Time: " .. os.date("%X")},
      { Text = "Color Scheme: " .. current_scheme .. " | Font: " .. font .. " | Time: " .. os.date("%X") .. " | Day: " .. tonumber(os.date("%w")) .. " of 7"},

    }))
  end
end

wezterm.on("update-status", time_func)

-- and finally, return the configuration to wezterm
local config = Config:init()
    :append(require("config.appearance"))
    :append(require("config.font"))
    :append(require("config.bindings"))
    :append(config)
    :append({status_update_interval = time_gap * 1000, color_scheme = color.get_scheme_by_weekday()}).options

return config
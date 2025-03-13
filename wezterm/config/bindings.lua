local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win then
  mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
  mod.SUPER_REV = "ALT|CTRL"
end


local hdfs_str = "hdfs dfs -ls -h /path"

-- 定义自定义事件，包含延迟
wezterm.on('send_delayed_actions', function(window, pane)
  pane:send_text("r\n")  -- 发送第一个字符串

  -- wezterm.sleep_ms(10000)  -- 延迟1.5秒

  pane:send_key({ key = 'UpArrow' })  -- 发送方向键向上
  pane:send_text("\n")  -- 发送回车

  pane:send_text(hdfs_str)
end)

-- https://github.com/wez/wezterm/issues/253
local keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
    {
        key="UpArrow", mods="OPT", action=wezterm.action.Multiple({
            wezterm.action.SendString("r\n"),
            --wezterm.sleep_ms(15000),
            wezterm.action.SendKey { key = 'UpArrow' },
            wezterm.action.SendString("\n"),
        })
    },
    -- {key="UpArrow", mods="OPT", action=wezterm.action.EmitEvent("send_delayed_actions"),},
    {key="DownArrow", mods="OPT", action=wezterm.action{SendString=hdfs_str}},
}

-- https://github.com/wez/wezterm/discussions/3541
local mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
            end
        end),
    },
}

return {
    -- disable_default_key_bindings = true,
    -- disable_default_mouse_bindings = true,
    -- leader = { key = "Space", mods = "CTRL|SHIFT" },
    keys = keys,
    -- key_tables = key_tables,
    mouse_bindings = mouse_bindings,
}
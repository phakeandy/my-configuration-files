local wezterm = require 'wezterm'

local launch_menu = {}
local default_prog = {}

-- 设置SHELL终端
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- windows下启用powershell
    local pwsh_path = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'

    -- term = '' -- Set to empty so FZF works on windows
    table.insert(launch_menu, {
        label = 'powershell',
        args = { pwsh_path, '-NoLogo' }
    })
    default_prog = { pwsh_path, '-NoLogo' }
end

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})

    -- 设置初始位置
    window:gui_window():set_position(350, 150)
    -- window:gui_window():maximize()
end)


local config = {
    font = wezterm.font 'CaskaydiaCove Nerd Font Mono', --设置默认字体
    font_size = 12,

    default_prog = default_prog,

    -- Tab Bar Config
    -- use_fancy_tab_bar = false,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = false,
    -- hide_tab_bar_if_only_one_tab = true,
    enable_tab_bar = false,  -- 关闭 tab_bar 

    window_padding = {
        left = 12,
        right = 12,
        top = 15,
        bottom = 10,
    },

    -- 初始窗口大小
    initial_rows = 38,
    initial_cols = 120,

    window_background_opacity = 0.95, -- 背景不透明度

    color_scheme = 'Obsidian (Gogh)', -- 设置主题
    window_decorations = "RESIZE",
    show_new_tab_button_in_tab_bar = false,

    -- 快捷键
    keys = {
        { key = 'z', mods = 'ALT', action = wezterm.action.ShowLauncher },
        {
            key = 'x', -- 绑定左侧 Alt 键
            mods = 'ALT',
            action = wezterm.action.ShowTabNavigator,
        },
    },


}

return config

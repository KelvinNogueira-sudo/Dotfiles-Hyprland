--     __  ___          _ __             
--    /  |/  /__  ___  (_) /____  _______
--   / /|_/ / _ \/ _ \/ / __/ _ \/ __(_-<
--  /_/  /_/\___/_//_/_/\__/\___/_/ /___/

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@59.99600",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
    mirror   = "eDP-1",
})


--     __  ___       ___                                 
--    /  |/  /_ __  / _ \_______  ___ ________ ___ _  ___
--   / /|_/ / // / / ___/ __/ _ \/ _ `/ __/ _ `/  ' \(_-<
--  /_/  /_/\_, / /_/  /_/  \___/\_, /_/  \_,_/_/_/_/___/
--         /___/                /___/                    

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"
local browser     = "brave"


--     ___       __       ______           __ 
--    / _ |__ __/ /____  / __/ /____ _____/ /_
--   / __ / // / __/ _ \_\ \/ __/ _ `/ __/ __/
--  /_/ |_\_,_/\__/\___/___/\__/\_,_/_/  \__/               

hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'Moe-Dark'")
hl.exec_cmd("hyprpaper")
hl.exec_cmd("waybar")
hl.exec_cmd("steam")
end)


--     ____         _                              __    _   __         _      __   __      
--    / __/__ _  __(_)______  ___  __ _  ___ ___  / /_  | | / /__ _____(_)__ _/ /  / /__ ___
--   / _// _ \ |/ / / __/ _ \/ _ \/  ' \/ -_) _ \/ __/  | |/ / _ `/ __/ / _ `/ _ \/ / -_|_-<
--  /___/_//_/___/_/_/  \___/_//_/_/_/_/\__/_//_/\__/   |___/\_,_/_/ /_/\_,_/_.__/_/\__/___/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


--     ___                _         _             
--    / _ \___ ______ _  (_)__ ___ (_)__  ___  ___
--   / ___/ -_) __/  ' \/ (_-<(_-</ / _ \/ _ \(_-<
--  /_/   \__/_/ /_/_/_/_/___/___/_/\___/_//_/___/

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


--     __             __                  __  ____    ____
--    / /  ___  ___  / /__  ___ ____  ___/ / / __/__ / / /
--   / /__/ _ \/ _ \/  '_/ / _ `/ _ \/ _  / / _// -_) / / 
--  /____/\___/\___/_/\_\  \_,_/_//_/\_,_/ /_/  \__/_/_/  

-- Config

hl.config({ dwindle   = { preserve_split = true }})
hl.config({ master    = { new_status = "master" }})
hl.config({ scrolling = { fullscreen_on_one_column = true }})
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,
	
	-- Color Border
        col = {
            active_border   = { colors = {"rgba(185, 12, 12, 0.88)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
	    color     = 0,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curves

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("workspaceBounce",{ type = "bezier", points = { {0.20, 0.86}, {0.30, 1.035}}})

-- Springs

hl.curve("easy",    { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.curve("winIn", { type = "spring", mass = 1, stiffness = 350, dampening = 35 })
hl.curve("winOut", { type = "spring", mass = 1, stiffness = 320, dampening = 32 })
hl.curve("winMove", { type = "spring", mass = 1, stiffness = 300, dampening = 30 })

-- Animations

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, spring = "winIn", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, spring = "winOut", style = "popin 85%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, spring = "winMove", style = "slide" })

hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })

hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })

hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })

hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3,    bezier = "workspaceBounce", style = "slide" })

hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })



--     __  ____        
--    /  |/  (_)__ ____
--   / /|_/ / (_-</ __/
--  /_/  /_/_/___/\__/ 
                   
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


--     ____               __ 
--    /  _/__  ___  __ __/ /_
--   _/ // _ \/ _ \/ // / __/
--  /___/_//_/ .__/\_,_/\__/ 
--          /_/              

hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "abnt2",
        kb_model   = "pc105",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false
        }
    }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })


--     __ __         __   _         ___             
--    / //_/__ __ __/ /  (_)__  ___/ (_)__  ___ ____
--   / ,< / -_) // / _ \/ / _ \/ _  / / _ \/ _ `(_-<
--  /_/|_|\__/\_, /_.__/_/_//_/\_,_/_/_//_/\_, /___/
--           /___/                        /___/     

-- Set Locals Keys
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local META = "SUPER + SHIFT_L" -- Sets "Copilot" key as Meta Key
local closeWindowBind = hl.bind("ALT + F4", hl.dsp.window.close())

-- Specific Keys
hl.bind(META, hl.dsp.exec_cmd(browser))
hl.bind("XF86Launch7", hl.dsp.exec_cmd(fileManager)) -- Tecla da MiniTela para Abrir FileManager
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active -o /home/kelvin/Imagens/Screenshots"))
hl.bind("XF86Launch8", hl.dsp.exec_cmd("wlogout -b 5 --margin-left=400px --margin-right=400px --margin-top=400px --margin-bottom=400px"))

-- Principal Keybinds
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + " .. "ALT" .. " + F", function()
    hl.dispatch(hl.dsp.window.float({ action = "set" }))
    hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600 }))
    hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + CONTROL + [0-9]
for workspace = 1, 10 do
    local key = workspace % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace}))
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Open and Close Waybar
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd("command killall waybar || waybar"))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",           hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl s 5%+"),                            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl s 5%-"),                            { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--   _      ___         __                              __  _      __         __                            
--  | | /| / (_)__  ___/ /__ _    _____   ___ ____  ___/ / | | /| / /__  ____/ /__ ___ ___  ___ ________ ___
--  | |/ |/ / / _ \/ _  / _ \ |/|/ (_-<  / _ `/ _ \/ _  /  | |/ |/ / _ \/ __/  '_/(_-</ _ \/ _ `/ __/ -_|_-<
--  |__/|__/_/_//_/\_,_/\___/__,__/___/  \_,_/_//_/\_,_/   |__/|__/\___/_/ /_/\_\/___/ .__/\_,_/\__/\__/___/
--                                                                                  /_/   

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({ match = { class = "code" }, opacity = "0.80" })
hl.window_rule({ match = { class = "thunar"}, opacity = "0.80" })
hl.window_rule({ match = { class = "brave-browser" }, opacity = "0.95" })
hl.window_rule({ match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false }, no_focus = true })
hl.window_rule({ match = { class = "hyprland-run" }, move = "20 monitor_h-120", float = true })
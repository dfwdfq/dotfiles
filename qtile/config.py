import os
import subprocess

import libqtile.resources
from libqtile import bar, layout, qtile, widget, hook
from libqtile.widget import Battery
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.layout.floating import Floating
from libqtile.utils import guess_terminal


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call(home)

@hook.subscribe.client_new
def center_floating_win(window):
    wm_name = window.cmd_inspect()["name"]
    if wm_name == "fkitty":
        window.toggle_floating()
        window.cmd_set_size_floating(640, 480)
        window.cmd_set_position_floating(100,100)
        #window.cmd_set_position_floating((1366 - 301) // 2, (768 - 227) // 2)
    
@hook.subscribe.startup_once
def start_picom():
    os.system("picom &")
    
@hook.subscribe.startup_once
def set_keyboard_layout():
    subprocess.run([
        "setxkbmap",
        "-layout", "us,ru",          
        "-option", "grp:alt_shift_toggle"  
    ])    
    
mod = "mod4"
terminal = guess_terminal()

keybindings_docs = """
mod + Return: launch terminal
mod + w: kill focused window
mod + r: spawn smenu
mod + f: toggle fullscreen on focused window
mod + control + r: reload config
mod + control + q: shutdown qtile
"""
keys = [
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "r", lazy.spawn("smenu"), desc="Spawn smenu"),
    Key([mod],"f",lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile")
]

groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below i2f you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Max(border_width=0)
]

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=20,
    padding=3,
)
extension_defaults = widget_defaults.copy()

logo = "/workshop/background.png"
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                Battery(format="🔋{percent:2.0%}"),
                widget.Clock(format="%H:%M", foreground="#e0e0ff"),
            ],
            24,
        ),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center"
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

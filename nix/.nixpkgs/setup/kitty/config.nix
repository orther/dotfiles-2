{ colors }:
with colors;
''
# vim:fileencoding=utf-8:ft=conf

# Font family. You can also specify different fonts for the
# bold/italic/bold-italic variants. By default they are derived automatically,
# by the OSes font system. Setting them manually is useful for font families
# that have many weight variants like Book, Medium, Thick, etc. For example:
# font_family Operator Mono Book
# bold_font Operator Mono Thick
# bold_italic_font Operator Mono Medium
# font_family      Input Mono
font_family      PragmataPro Mono
italic_font      auto
bold_font        auto
bold_italic_font auto

# Font size (in pts)
font_size        12.0

# The amount the font size is changed by (in pts) when increasing/decreasing
# the font size in a running terminal.
font_size_delta 2

# The foreground color
foreground       ${foreground}

# The background color
background       ${background}

# The foreground for selections
selection_foreground ${background}

# The background for selections
selection_background ${foreground}

# The cursor color
cursor           ${foreground}

# The cursor shape can be one of (block, beam, underline)
cursor_shape     block

# The interval (in seconds) at which to blink the cursor. Set to zero to
# disable blinking.
cursor_blink_interval     0.5

# Stop blinking cursor after the specified number of seconds of keyboard inactivity. Set to
# zero or a negative number to never stop blinking.
cursor_stop_blinking_after 15.0

# Number of lines of history to keep in memory for scrolling back
scrollback_lines 2000

# Program with which to view scrollback in a new window. The scrollback buffer is passed as
# STDIN to this program. If you change it, make sure the program you use can
# handle ANSI escape sequences for colors and text formatting.
scrollback_pager less +G -R

# When viewing scrollback in a new window, put it in a new tab as well
scrollback_in_new_tab no

# Wheel scroll multiplier (modify the amount scrolled by the mouse wheel)
wheel_scroll_multiplier 5.0

# The interval between successive clicks to detect double/triple clicks (in seconds)
click_interval 0.5

# Characters considered part of a word when double clicking. In addition to these characters
# any character that is marked as an alpha-numeric character in the unicode
# database will be matched.
select_by_word_characters :@-./_~?&=%+#

# Hide mouse cursor after the specified number of seconds of the mouse not being used. Set to
# zero or a negative number to disable mouse cursor hiding.
mouse_hide_wait 3.0

# The enabled window layouts. A comma separated list of layout names. The special value * means
# all layouts. The first listed layout will be used as the startup layout.
# For a list of available layouts, see the file layouts.py
enabled_layouts *

# If enabled, the window size will be remembered so that new instances of kitty will have the same
# size as the previous instance. If disabled, the window will initially have size configured
# by initial_window_width/height, in pixels.
remember_window_size   no
initial_window_width   640
initial_window_height  400

# Delay (in milliseconds) between screen updates. Decreasing it, increases fps
# at the cost of more CPU usage. The default value yields ~100fps which is more
# that sufficient for most uses.
# repaint_delay    10
repaint_delay    10

# Delay (in milliseconds) before input from the program running in the terminal
# is processed. Note that decreasing it will increase responsiveness, but also
# increase CPU usage and might cause flicker in full screen programs that
# redraw the entire screen on each loop, because kitty is so fast that partial
# screen updates will be drawn.
input_delay 3

# Visual bell duration. Flash the screen when a bell occurs for the specified number of
# seconds. Set to zero to disable.
visual_bell_duration 0.0

# Enable/disable the audio bell. Useful in environments that require silence.
enable_audio_bell yes

# The modifier keys to press when clicking with the mouse on URLs to open the URL
open_url_modifiers ctrl+shift

# The program with which to open URLs that are clicked on. The special value "default" means to
# use the operating system's default URL handler.
open_url_with default

# Choose whether to use the system implementation of wcwidth() (used to
# control how many cells a character is rendered in).  If you use the system
# implementation, then kitty and any programs running in it will agree. The
# problem is that system implementations often are based on outdated unicode
# standards and get the width of many characters, such as emoji, wrong. So if
# you are using kitty with programs that have their own up-to-date wcwidth()
# implementation, set this option to no.
use_system_wcwidth yes

# The value of the TERM environment variable to set
term xterm-kitty

# The width (in pts) of window borders. Will be rounded to the nearest number of pixels based on screen resolution.
window_border_width 0

window_margin_width 15

# The color for the border of the active window
active_border_color ${foreground}

# The color for the border of inactive windows
inactive_border_color ${background}

# Tab-bar colors
active_tab_foreground ${background}
active_tab_background ${foreground}
inactive_tab_foreground ${foreground}
inactive_tab_background ${background}


# The 16 terminal colors. There are 8 basic colors, each color has a dull and
# bright version.

# black
color0   ${color0}
color8   ${color8}

# red
color1   ${color1}
color9   ${color9}

# green
color2    ${color2}
color10   ${color10}

# yellow
color3    ${color3}
color11   ${color11}

# blue
color4   ${color4}
color12  ${color12}

# magenta
color5   ${color5}
color13  ${color13}

# cyan
color6   ${color6}
color14  ${color14}

# white
color7   ${color7}
color15  ${color15}

# Key mapping
# For a list of key names, see: http://www.glfw.org/docs/latest/group__keys.html
# For a list of modifier names, see: http://www.glfw.org/docs/latest/group__mods.html
# You can use the special action no_op to unmap a keyboard shortcut that is
# assigned in the default configuration.

# Clipboard
map super+v             paste_from_clipboard
map ctrl+shift+s        paste_from_selection
map super+c             copy_to_clipboard
map shift+insert        paste_from_selection

# Scrolling
map ctrl+shift+up        scroll_line_up
map ctrl+shift+down      scroll_line_down
map ctrl+shift+k         scroll_line_up
map ctrl+shift+j         scroll_line_down
map ctrl+shift+page_up   scroll_page_up
map ctrl+shift+page_down scroll_page_down
map ctrl+shift+home      scroll_home
map ctrl+shift+end       scroll_end
map ctrl+shift+h         show_scrollback

# Window management
map super+n             new_os_window
map super+w             close_window
map ctrl+shift+enter    new_window
map ctrl+shift+]        next_window
map ctrl+shift+[        previous_window
map ctrl+shift+f        move_window_forward
map ctrl+shift+b        move_window_backward
map ctrl+shift+`        move_window_to_top
map ctrl+shift+1        first_window
map ctrl+shift+2        second_window
map ctrl+shift+3        third_window
map ctrl+shift+4        fourth_window
map ctrl+shift+5        fifth_window
map ctrl+shift+6        sixth_window
map ctrl+shift+7        seventh_window
map ctrl+shift+8        eighth_window
map ctrl+shift+9        ninth_window
map ctrl+shift+0        tenth_window

# Tab management
map ctrl+shift+right    next_tab
map ctrl+shift+left     previous_tab
map ctrl+shift+t        new_tab
map ctrl+shift+q        close_tab
map ctrl+shift+l        next_layout
map ctrl+shift+.        move_tab_forward
map ctrl+shift+,        move_tab_backward

# Miscellaneous
map ctrl+shift+up      increase_font_size
map ctrl+shift+down    decrease_font_size
map ctrl+shift+backspace restore_font_size

# Symbol mapping (special font for specified unicode code points). Map the
# specified unicode codepoints to a particular font. Useful if you need special
# rendering for some symbols, such as for Powerline. Avoids the need for
# patched fonts. Each unicode code point is specified in the form U+<code point
# in hexadecimal>. You can specify multiple code points, separated by commas
# and ranges separated by hyphens. symbol_map itself can be specified multiple times.
# Syntax is:
#
# symbol_map codepoints Font Family Name
#
# For example:
#
#symbol_map U+E0A0-U+E0A2,U+E0B0-U+E0B3 PowerlineSymbols
macos_hide_titlebar yes
macos_option_as_alt yes
''

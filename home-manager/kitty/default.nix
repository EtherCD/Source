let 

	pkgs = import <nixpkgs> {};

in

{   
    programs.kitty = {
        enable = true;

        extraConfig = ''
            symbol_map U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d4,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f532,U+f0001-U+f1af0 Symbols Nerd Font Mono
            symbol_map U+2600-U+26FF Noto Color Emoji

            map ctrl+c copy_to_clipboard
            map ctrl+v paste_from_clipboard
            map ctrl+t new_tab
            map ctrl+q close_tab
            map ctrl+tab next_tab
        '';


        settings = {
            dynamic_background_opacity = true;
            background_opacity = "0.7";
            background_tint = "0.5";
            #transparent_background_colors = "#282828@0.3";
            background_blur = 20;
            window_padding_width = 10;
            font_family = "Fantasque Sans Mono";
            font_size = 14;
            cursor = "#98971a";
            cursor_text_color = "#b8bb26";
            cursor_shape = "block";
            cursor_blink_interval = "0.5";
            cursor_trail = true;
            tab_bar_edge = "top";
            term = "xterm-256color";
            copy_on_select = "clipboard";

            color0 = "#282828";
            color1 = "#cc241d";
            color2 = "#98971a";
            color3 = "#d79921";
            color4 = "#458588";
            color5 = "#b16286";
            color6 = "#689d6a";
            color7 = "#928374";
            color8 = "#ebdbb2";
            color9 = "#fb4934";
            color10 = "#b8bb26";
            color11 = "#fabd2f";
            color12 = "#83a598";
            color13 = "#d3869b";
            color14 = "#8ec07c";
            color15 = "#fbf1c7";

        };
    };
}
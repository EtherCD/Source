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
            background_opacity = "0.3";
            background_blur = 5;
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
        };
    };
}
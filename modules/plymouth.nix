let

    pkgs = import <nixpkgs> {};

in

{
    boot = {
        plymouth = {
            enable = true;
            # circuit     abstract_ring_alt
            theme = "circuit";
            themePackages = with pkgs; [
                (adi1090x-plymouth-themes.override {
                    selected_themes = [ "circuit" ];
                })
            ];
        };
    };
}
{
    services = {
			displayManager = {
                sddm.enable = true;
				sddm.wayland.enable = true;
				defaultSession = "hyprland";
			};
    };
    
    programs.hyprland = {
        enable = true;
    };

    programs.waybar = {
        enable = true;
    };
}
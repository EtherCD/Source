{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
		
		packages = with pkgs; [
			vscode
			vlc
			kitty
			lsd
			bat
			btop
			fzf
			viber
			fastfetch
			cpufetch
			nerdfetch
		];
	};

	imports =
		[
			./git
			./firefox
			./vscode
			./obs-studio
			./kitty
			./lsd
			./bat
		];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
    syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild = "doas nixos-rebuild switch --impure";
			clean = "doas nix-store --gc";
			rcode = "doas code --no-sandbox --user-data-dir=/home/ex-root/";
			ls = "lsd";
			l = "lsd -l";
			t = "lsd --tree --depth";
			c = "bat";
			#cat = "bat";
		};
		oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "half-life";
    };
	};

	programs.home-manager = {
		enable = true;
	};
}


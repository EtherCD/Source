{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
		
		packages = with pkgs; [
			firefox
			vscode
			vlc
		];
	};

	imports =
		[
			./git
			./firefox
			./vscode
			./obs-studio
		];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
    syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --impure";
			rcode = "sudo code --no-sandbox --user-data-dir=/home/ex-root/";
		};
		oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "jaischeema";
    };
	};

	programs.home-manager = {
		enable = true;
	};
}


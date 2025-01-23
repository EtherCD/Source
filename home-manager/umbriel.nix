{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
	};

	imports =
		[
			./git
		];


	programs.zsh = {
		enable = true;
		enableCompletion = true;
    syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --impure";
			tbuild = "sudo nixos-rebuild test --impure"; 
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


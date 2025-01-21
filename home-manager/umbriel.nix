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


	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --impure";
			tbuild = "sudo nixos-rebuild test --impure"; 
		};
	};

	
	programs.home-manager = {
		enable = true;
	};
}


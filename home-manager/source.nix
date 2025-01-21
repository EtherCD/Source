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


	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --impure";
			tbuild = "sudo nixos-rebuild test --impure"; 
			rcode = "sudo code --no-sandbox --user-data-dir=/home/ex-root/";
		};
	};

	
	programs.home-manager = {
		enable = true;
	};
}


{ config, pkgs, ... }: {
	home = {
		username = "ethercd";
		homeDirectory = "/home/ethercd";
		stateVersion = "24.05";
		
		packages = with pkgs; [
			fastfetch
			firefox
			vscode
			vlc
		];
	};

	imports =
		[
			./git.nix
			./firefox.nix
			./vscode.nix
			./obs-studio.nix
			#./plasma.nix
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


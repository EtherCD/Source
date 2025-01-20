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

	programs.fish = {
		enable = true;
		plugins = [{
			name="foreign-env";
			src = pkgs.fetchFromGitHub {
				owner = "oh-my-fish";
				repo = "plugin-foreign-env";
				rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
				sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
			};
		}];

		shellInit =
		''
			# nix
			if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
				fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
			end

			# home-manager
			if test -e <nix_file_path_file>
				fenv source <nix_file_path_file>
			end
		'';
		
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


let 

	pkgs = import <nixpkgs> {};

in

{
  programs.zsh = {
		enable = true;
		enableCompletion = true;
    syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild = "doas nixos-rebuild switch --impure";
			clean = "doas nix-store --gc";
			ls = "lsd";
			l = "lsd -l";
			t = "lsd --tree --depth";
			c = "bat";
			#cat = "bat";
		};
		initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      if [[ -r "$\{XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$\{(%):-%n}.zsh" ]]; then
        source "$\{XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$\{(%):-%n}.zsh"
      fi

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" ];
			theme = "half-life";
		};
	};
  home.file.".p10k.zsh".source = ./.p10k.zsh;
}
let

pkgs = import <nixpkgs> {}; 

in 

pkgs.rustPlatform.buildRustPackage rec {
    pname = "spotify-adblock";
    version = "1.0.3";

    src = builtins.fetchTarball {
		sha256 = "0wvw4vcj0qc08s1dcrdyq2qr243p9cq2i8hw05d7qnfhgw1cjdis";
        url = "https://github.com/abba23/spotify-adblock/archive/7391666109c8f9d0ccc8254dc0ff7e28139c663b.tar.gz";
	};

    # postinstall = ''x
    # make
    # make install
    # '';

    cargoHash = "sha256-wPV+ZY34OMbBrjmhvwjljbwmcUiPdWNHFU3ac7aVbIQ=";

    nativeBuildInputs = with pkgs; [ makeShellWrapper ];

    fixupPhase = ''
      runHook preFixup

        cp $out/lib/libspotifyadblock.so $out/lib/spotify-adblock

        wrapProgramShell $out/lib/spotify-adblock

      runHook postFixup
    '';

    meta = {
        description = "Adblocker for Spotify";
        homepage = "https://github.com/sondr3/dotfiles";
        license = "MIT";
        maintainers = [ "abba23" ];
    };
}
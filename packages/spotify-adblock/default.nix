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

    cargoHash = "sha256-wPV+ZY34OMbBrjmhvwjljbwmcUiPdWNHFU3ac7aVbIQ=";

    installPhase = ''
    runHook preFixup

    mkdir -p $out/bin


    if [ -f target/x86_64-unknown-linux-gnu/release/libspotifyadblock.so ]; then
      cp target/x86_64-unknown-linux-gnu/release/libspotifyadblock.so $out/bin/spotify-adblock
    else
      echo "Error: file libspotifyadblock.so is not found"
      exit 1
    fi

    chmod +x $out/bin/spotify-adblock

    runHook postFixup
  '';

    meta = {
        description = "Adblocker for Spotify";
        homepage = "https://github.com/sondr3/dotfiles";
        license = "MIT";
        maintainers = [ "abba23" ];
    };
}
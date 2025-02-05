let

pkgs = import <nixpkgs> {}; 

in

pkgs.stdenv.mkDerivation
{
    pname = "beefetch";
    version = "1.1.4";
    src = pkgs.fetchFromGitHub {
        owner = "mirdukkkkk";
        repo = "beefetch";
        rev = "1.1.4";
        hash = "sha256-D8IjGGRIeHhDL2jfdxTQWKtTvSmH8XUXI6pRvVXVzfU=";
    };

    installPhase = ''
        mkdir -p $out/bin
        install -Dm755 beefetch $out/bin/beefetch
    '';

    meta = {
        description = "🐝";
        homepage = "https://github.com/mirdukkkkk/beefetch";
        license = "GPL-3.0-only";
        maintainers = [ "mirdukkkkk" ];
    };
}
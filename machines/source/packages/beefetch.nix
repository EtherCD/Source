let

pkgs = import <nixpkgs> {}; 

in

pkgs.stdenv.mkDerivation
{
    pname = "beefetch";
    version = "1.1.2";
    src = pkgs.fetchFromGitHub {
        owner = "mirdukkkkk";
        repo = "beefetch";
        rev = "1.1.2";
        hash = "sha256-+UGs4/dU30NEyxkxtCiZGfOmYVMQdtCDhYFx6UnJq0w=";
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
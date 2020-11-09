{ callPackage, nixpkgs, icu66 }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { icu = icu66; };
in
buildNodejs {
  version = "12.16.0";
  sha256 = "09grij355z210mkzkzarb6gwz8b02lnaxzdll1249kiz8wvhdjdq";
}

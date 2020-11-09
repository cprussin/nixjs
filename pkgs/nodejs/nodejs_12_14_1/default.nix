{ callPackage, nixpkgs }:

let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" {};
in

buildNodejs {
  version = "12.14.1";
  sha256 = "1nvsivl496fgaypbk2pqqh7py29g7wsggyjlqydy1c0q4f24nyw7";
}

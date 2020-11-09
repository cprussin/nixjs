{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "10.15.1";
  sha256 = "0n68c4zjakdj6yzdc9fbrn0wghyslkya9sz1v6122i40zfwzfm8s";
}

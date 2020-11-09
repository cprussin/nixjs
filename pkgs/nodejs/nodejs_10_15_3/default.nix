{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "10.15.3";
  sha256 = "1mcijznh481s44i59p571a38bfvcxm9f8x2l0l1005aly0kdj8jf";
}

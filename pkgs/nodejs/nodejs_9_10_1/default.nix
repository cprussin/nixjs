{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "9.10.1";
  sha256 = "1widvxbc8sp8p8vp7q38b3zy0w1nx4iaqmp81s6bvaqs08h7wfy9";
}

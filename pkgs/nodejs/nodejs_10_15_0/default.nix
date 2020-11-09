{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "10.15.0";
  sha256 = "0gnygq4n7aar4jrynnnslxhlrlrml9f1n9passvj2fxqfi6b6ykr";
}

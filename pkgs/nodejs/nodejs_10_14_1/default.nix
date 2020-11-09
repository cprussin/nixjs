{ callPackage, nixpkgs }:
let
  buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" { };
in
buildNodejs {
  version = "10.14.1";
  sha256 = "0d5hg8hf4c1sshh77a6hy944bzm3q3ipqggbyim61q3r2szngvrx";
}

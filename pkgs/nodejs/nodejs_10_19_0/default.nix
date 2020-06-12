{ callPackage }:

let
  buildNodejs = callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
in

buildNodejs {
  version = "10.19.0";
  sha256 = "0sginvcsf7lrlzsnpahj4bj1f673wfvby8kaxgvzlrbb7sy229v2";
}

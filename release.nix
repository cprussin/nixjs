versions@{
  nodejs ? null,
  yarn ? null
}:

let
  nixjs = import (./.) versions;
  pkgs = import <nixpkgs> { overlays = [ nixjs ]; };
in

map (pkg: pkgs."${pkg}") (builtins.attrNames versions)

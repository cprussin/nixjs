{ nixpkgs ? (import ./sources.nix).nixpkgs
}:
let
  files = import ./files.nix;
  pkgs = import nixpkgs { overlays = [ ]; };
in
pkgs.writeShellScriptBin "format" "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt $@ ${files}"

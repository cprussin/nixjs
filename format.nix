{ nixpkgs ? (import ./sources.nix).nixpkgs
}:

let
  files = import ./files.nix;
  pkgs = import nixpkgs { overlays = []; };
in

pkgs.writeShellScriptBin "format" "nixpkgs-fmt $@ ${files}"

{ nixpkgs ? <nixpkgs>, versions }: _: super:
let
  pkgs = super.callPackage ./pkgs { inherit nixpkgs; };
  normalizeVersion = builtins.replaceStrings [ "." ] [ "_" ];
  getPackage = pkg: version: pkgs."${pkg}_${normalizeVersion version}";
in
super.lib.mapAttrs getPackage versions

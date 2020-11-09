{ nixpkgs ? <nixpkgs>, versions }: _: super:
let
  pkgs = import ./pkgs {
    inherit nixpkgs;
    callPackage = super.callPackage;
  };
  normalizeVersion = builtins.replaceStrings [ "." ] [ "_" ];
  getPackage = pkg: version: pkgs."${pkg}_${normalizeVersion version}";
in
super.lib.mapAttrs getPackage versions

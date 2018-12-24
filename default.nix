versions: self: super:

let

  pkgs = import ./pkgs { callPackage = super.callPackage; };

  normalizeVersion = builtins.replaceStrings ["."] ["_"];

  overlay = pkg:
    let
      version = versions."${pkg}" or null;
    in
      if version == null
        then {}
        else { "${pkg}" = pkgs."${pkg}_${normalizeVersion version}"; };

in

overlay "nodejs" // overlay "yarn" // overlay "purescript"

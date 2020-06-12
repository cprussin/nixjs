{ nodejs ? null
, yarn ? null
}:

let
  versions =
    if nodejs == null
    then { inherit yarn; }
    else
      if yarn == null
      then { inherit nodejs; }
      else { inherit nodejs yarn; };
  nixjs = import (./.) versions;
  pkgs = import <nixpkgs> { overlays = [ nixjs ]; };
in

map (pkg: pkgs."${pkg}") (builtins.attrNames versions)

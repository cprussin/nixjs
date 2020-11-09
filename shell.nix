let
  sources = import ./sources.nix;
in
{ nixpkgs ? sources.nixpkgs
, niv ? sources.niv
}:
let
  niv-overlay = self: _: {
    niv = self.symlinkJoin {
      name = "niv";
      paths = [ niv ];
      buildInputs = [ self.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/niv \
          --add-flags "--sources-file ${toString ./sources.json}"
      '';
    };
  };

  pkgs = import nixpkgs {
    overlays = [
      niv-overlay
    ];
  };

  lint = import ./lint.nix { inherit nixpkgs; };
  format = import ./format.nix { inherit nixpkgs; };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.niv
    lint
    format
  ];
}

let
  sources = import ./sources.nix;
in

{ nix-linter ? sources.nix-linter
, nixpkgs ? sources.nixpkgs
}:

let
  nix-linter-overlay = self: _: {
    nix-linter = (self.callPackage nix-linter {}).nix-linter;
  };

  niv-overlay = self: _: {
    niv = self.symlinkJoin {
      name = "niv";
      paths = [ sources.niv ];
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
      nix-linter-overlay
    ];
  };

  files = "$(find . -name '*.nix')";

  lint = pkgs.writeShellScriptBin "lint" "nix-linter $@ ${files}";

  format = pkgs.writeShellScriptBin "format" "nixpkgs-fmt $@ ${files}";
in

pkgs.mkShell {
  buildInputs = [
    pkgs.niv
    pkgs.nix-linter
    pkgs.nixpkgs-fmt
    lint
    format
  ];
}

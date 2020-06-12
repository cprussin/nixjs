let
  nivSrc = fetchTarball {
    url = "https://github.com/nmattia/niv/tarball/2ecfd86b631714b457e56d70dd83fa60435baeb6";
    sha256 = "01j6727cws8blg1npp54b4w6xa0gpgyzhyws2vqgp8clnlnmqqhi";
  };
  sources = import "${nivSrc}/nix/sources.nix" {
    sourcesFile = ./sources.json;
  };
  niv = import nivSrc {};
in

niv // sources

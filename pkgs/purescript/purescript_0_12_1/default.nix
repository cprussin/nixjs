{ stdenv, fetchurl, makeWrapper, patchelf, gmpxx, ncurses5, zlib }:

let
  system = stdenv.lib.hostPlatform.system;
  libs = stdenv.lib.makeLibraryPath [ stdenv.cc.cc gmpxx ncurses5 zlib ];
in

stdenv.mkDerivation rec {
  name = "purescript-binary-${version}";
  version = "0.12.1";

  src = fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
    sha256 = "01az5127g7jpznsjvpkrl59i922fc5i219qdvsrimzimrv08mr18";
    name = "purescript.tar.gz";
  };

  buildInputs = [ makeWrapper ];
  unpackCmd = "tar -xzf $curSrc";

  installPhase = ''
    mkdir -p $out/bin $out/lib
    cp purs $out/bin/
    runHook postInstall
  '';

  postInstall = ''
    interpreter="$(cat $NIX_CC/nix-support/dynamic-linker)"
    ${patchelf}/bin/patchelf --set-interpreter $interpreter $out/bin/purs
    wrapProgram $out/bin/purs --prefix LD_LIBRARY_PATH : ${libs}
  '';

  meta = {
    description = ''
      A small strongly typed programming language with expressive types that
      compiles to JavaScript, written in and inspired by Haskell.
    '';
    homepage = http://www.purescript.org/;
    license = stdenv.lib.licenses.bsd3;
    platforms = [ "x86_64-linux" ];
  };
}

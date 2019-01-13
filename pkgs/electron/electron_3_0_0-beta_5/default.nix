{ stdenv, libXScrnSaver, makeWrapper, fetchurl, unzip, atomEnv, gtk2, at-spi2-atk }:

stdenv.mkDerivation rec {
  version = "3.0.0-beta.5";
  name = "electron-${version}";

  meta = with stdenv.lib; {
    description = "Cross platform desktop application shell";
    homepage = https://github.com/electron/electron;
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };

  src = fetchurl {
    url = "https://github.com/electron/electron/releases/download/v${version}/electron-v${version}-linux-x64.zip";
    sha256 = "17gvdc2iq9cik4qca9zp8mlkg4h4y3m081fj43x6shgzzkmvvhbb";
  };

  buildInputs = [ unzip makeWrapper ];

  buildCommand = ''
    mkdir -p $out/lib/electron $out/bin
    unzip -d $out/lib/electron $src
    ln -s $out/lib/electron/electron $out/bin
    fixupPhase
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath "${atomEnv.libPath}:${gtk2}/lib:${at-spi2-atk}/lib:$out/lib/electron" \
      $out/lib/electron/electron
    wrapProgram $out/lib/electron/electron \
      --prefix LD_PRELOAD : ${stdenv.lib.makeLibraryPath [ libXScrnSaver ]}/libXss.so.1
  '';
}

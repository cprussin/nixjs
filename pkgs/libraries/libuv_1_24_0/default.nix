{ stdenv
, lib
, fetchFromGitHub
, autoconf
, automake
, libtool
, pkgconfig
}:

stdenv.mkDerivation rec {
  version = "1.24.0";
  name = "libuv-${version}";

  src = fetchFromGitHub {
    owner = "libuv";
    repo = "libuv";
    rev = "v${version}";
    sha256 = "1xfggj0mbbshj7zyccnfw7wyk42qfg4ng3l4aslw014mg8gaskv7";
  };

  postPatch = let
    disable = lib.concatStringsSep "\\|" [

      # probably network-dependent
      "getnameinfo_basic_ip4"
      "getnameinfo_basic_ip4_sync"
      "getnameinfo_basic_ip6"

      # user namespaces
      "spawn_setuid_fails"
      "spawn_setgid_fails"
      "fs_chown"

    ];
  in
    lib.optionalString doCheck "sed '/${disable}/d' -i test/test-list.h";

  nativeBuildInputs = [ automake autoconf libtool pkgconfig ];

  preConfigure = "LIBTOOLIZE=libtoolize ./autogen.sh";

  enableParallelBuilding = true;

  doCheck = true;

  meta = with lib; {
    description = "A multi-platform support library with a focus on asynchronous I/O";
    homepage = https://github.com/libuv/libuv;
    maintainers = with maintainers; [ cstrahan ];
    platforms = with platforms; linux ++ darwin;
    license = with licenses; [ mit isc bsd2 bsd3 cc-by-40 ];
  };

}

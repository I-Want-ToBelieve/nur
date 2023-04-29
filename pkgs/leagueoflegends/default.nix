{ stdenv, fetchFromGitHub }:

# @see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=leagueoflegends-git
stdenv.mkDerivation rec {
  name = "leagueoflegends-${version}";
  version = "13.7.2";
  src = fetchFromGitHub ({
    owner = "kyechou";
    repo = "leagueoflegends";
    rev = "v13.7.2";
    fetchSubmodules = false;
    sha256 = "sha256-kzdPIceii39sfuesGGZCunXmBD01PL2b13zMbdwwxa4=";
  });
  makeFlags = [ "DESTDIR=$out" ];
}

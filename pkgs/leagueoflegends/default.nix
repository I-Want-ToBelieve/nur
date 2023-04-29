{ stdenv, fetchFromGitHub, lib }:

# @see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=leagueoflegends-git
# @see https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/misc/tdrop/default.nix
stdenv.mkDerivation rec {
  name = "leagueoflegends";
  version = "13.7.2";
  src = fetchFromGitHub ({
    owner = "kyechou";
    repo = "leagueoflegends";
    rev = "v13.7.2";
    fetchSubmodules = false;
    sha256 = "sha256-kzdPIceii39sfuesGGZCunXmBD01PL2b13zMbdwwxa4=";
  });

  dontBuild = true;

  installFlags = [ "PREFIX=$(out)" "DESTDIR=''"];

  meta = with lib; {
    description = "League of Legends install and launch wrapper for Linux";
    homepage = "https://github.com/kyechou/leagueoflegends";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}

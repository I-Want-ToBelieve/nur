# @see https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/rime-dict/default.nix
{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  ...
} @ args:
stdenvNoCC.mkDerivation rec {
  pname = "rime-dict";
  version = "9f9f736911e5f569210a90c0cdcf5a4808fcd2c1";
  src = fetchFromGitHub ({
    owner = "I-Want-ToBelieve";
    repo = "rime-dict";
    rev = "9f9f736911e5f569210a90c0cdcf5a4808fcd2c1";
    fetchSubmodules = false;
    sha256 = "sha256-Y2nrqwRAD6gy2HZu6OPuKPOCu0YvQ5961lVJ+W0P5Dc=";
  });
  installPhase = ''
    mkdir -p $out/share/rime-data
    find ${src} -name "*.dict.yaml" -exec cp {} $out/share/rime-data/ \;
  '';

  meta = with lib; {
    description = "RIME 词库增强";
    homepage = "https://github.com/I-Want-ToBelieve/rime-dict";
  };
}

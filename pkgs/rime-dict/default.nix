# @see https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/rime-dict/default.nix
{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  ...
} @ args:
stdenvNoCC.mkDerivation rec {
  pname = "rime-dict";
  version = "325ecbda51cd93e07e2fe02e37e5f14d94a4a541";
  src = fetchFromGitHub ({
    owner = "I-Want-ToBelieve";
    repo = "rime-dict";
    rev = "325ecbda51cd93e07e2fe02e37e5f14d94a4a541";
    fetchSubmodules = false;
    sha256 = "sha256-LmY2EQ1VjfX9UJ8ubwoHgxDdJUicSuE0uqxKRnniJ+k=";
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

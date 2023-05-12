# @see https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/rime-dict/default.nix
{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  ...
} @ args:
stdenvNoCC.mkDerivation rec {
  pname = "rime-dict";
  version = "da792878d2f2d3ce2d522822853c0adac84c9513";
  src = fetchFromGitHub ({
    owner = "I-Want-ToBelieve";
    repo = "rime-dict";
    rev = "da792878d2f2d3ce2d522822853c0adac84c9513";
    fetchSubmodules = false;
    sha256 = "sha256-+3PdZQ9sAZ63AioA2/apwhsjz5pR3uKHWx0kz28i3fk=";
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

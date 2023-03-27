{ stdenv
, lib
, fetchFromGitHub
, ...
} @ args:

# @see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-ubuntu-mono-ligaturized-git
stdenv.mkDerivation rec {
  name = "ttf-ubuntu-mono-ligaturized";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "I-Want-ToBelieve";
    repo = "ubuntu-mono-ligaturized";
    rev = "master";
    hash = "sha256-YmQUCLmopwwLtYogMOH0x+GFD9yXu5Va8VrpwTNhJbk=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    install -Dm644 *.ttf -t $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "About Ubuntu Mono font with programming ligatures.";
    homepage = "https://github.com/I-Want-ToBelieve/ubuntu-mono-ligaturized?organization=I-Want-ToBelieve&organization=I-Want-ToBelieve";
    license = licenses.gpl3;
  };
}

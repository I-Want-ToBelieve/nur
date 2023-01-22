{ stdenv
, lib
, fetchurl
, unzip
, rime-data
, librime
, ...
} @ args:

# @see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=rime-cloverpinyin
stdenv.mkDerivation rec {
  name = "rime-cloverpinyin";
  version = "1.1.4";
  src = fetchurl {
    url = "https://github.com/fkxxyz/rime-cloverpinyin/releases/download/${version}/clover.schema-${version}.zip";
    sha256 = "sha256-Mn1qb5pndyRAGZzklh3a4KukAHgoUSLTJ1hP8Rb9R4s=";
  };
  nativeBuildInputs = [ unzip rime-data librime ];
  buildInputs = [ rime-data ];
  unpackPhase = ''
    unzip $src
  '';
  buildPhase = ''
  rime_deployer --compile clover.schema.yaml .  ${rime-data}/share/rime-data
  '';
  installPhase = ''
     rm build/*.txt
     rm -rf opencc
     install -Dm644 *.yaml -t $out/usr/share/rime-data/
     install -Dm644 build/* -t $out/usr/share/rime-data/build/
  '';
  meta = with lib; {
    description = "Clover Simplified pinyin input for rime";
    homepage = "https://github.com/fkxxyz/rime-cloverpinyin";
    license = licenses.lgpl3Only;
  };
}

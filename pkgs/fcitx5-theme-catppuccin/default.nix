{
  stdenv,
  lib,
  fetchFromGitHub,
  ...
} @ args:
# @see https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/fcitx5-breeze/default.nix
# @see https://github.com/catppuccin/fcitx5
stdenv.mkDerivation rec {
  name = "fcitx5-theme-catppuccin";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "fcitx5";
    rev = "main";
    sha256 = "sha256-uFaCbyrEjv4oiKUzLVFzw+UY54/h7wh2cntqeyYwGps=";
  };
  installPhase = ''
    mkdir -p $out/share/fcitx5/themes
    cp -rf --no-preserve=ownership --preserve=mode ./src/* $out/share/fcitx5/themes
  '';
  meta = with lib; {
    description = "Soothing pastel theme for Fcitx5 ";
    homepage = "https://github.com/catppuccin/fcitx5";
    license = licenses.mit;
  };
}

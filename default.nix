# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package {};
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
  rime-cloverpinyin = pkgs.callPackage ./pkgs/rime-cloverpinyin {};
  fcitx5-theme-catppuccin = pkgs.callPackage ./pkgs/fcitx5-theme-catppuccin {};
  krabby = pkgs.callPackage ./pkgs/krabby {};
  autohide-tdrop = pkgs.callPackage ./pkgs/autohide-tdrop {};
  ttf-ubuntu-mono-ligaturized = pkgs.callPackage ./pkgs/ttf-ubuntu-mono-ligaturized  {};
  leagueoflegends = pkgs.callPackage ./pkgs/leagueoflegends  {};
  obinskit = pkgs.callPackage ./pkgs/obinskit {};
}

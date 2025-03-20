{
  stdenv,
  lib,
  fetchFromGitHub,
  rustPlatform,
  ...
} @ args:
# @see https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#buildrustpackage-compiling-rust-applications-with-cargo-compiling-rust-applications-with-cargo
rustPlatform.buildRustPackage rec {
  pname = "krabby";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "I-Want-ToBelieve";
    repo = pname;
    rev = "main";
    hash = "sha256-9MAoovF7YgnLROw8ldrgVxL+Q21GC5K15khSMDzQgac=";
  };

  cargoHash = "sha256-jbmVsWnP7kyz/Ccc4jN/TqumCKQKy4kfQMDnRCy+rl0=";

  meta = with lib; {
    description = "Print pokemon sprites in your terminal";
    homepage = "https://github.com/yannjor/krabby/";
    mainProgram = pname;
    license = licenses.gpl3Only;
  };
}

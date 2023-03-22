{
  stdenv,
  lib,
  fetchFromGitHub,
  rustPlatform,
  ...
} @ args:
# @see https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#buildrustpackage-compiling-rust-applications-with-cargo-compiling-rust-applications-with-cargo
rustPlatform.buildRustPackage rec {
  pname = "autohide-tdrop";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "I-Want-ToBelieve";
    repo = pname;
    rev = "main";
    hash = "sha256-uRjNHbVDb3RGLDpuEp403AXtpcpDaHBxhdoqDPm2fHc=";
  };

  cargoHash = "sha256-TcRV9tl/JKGEIvXOuMMCH663oZYkO+n5/GO4JwpWtoI=";

  meta = with lib; {
    description = ''
      100% pure rust implementation
      that can automatically hide terminals or other applications managed by tdrop
      when they lose focus
    '';
    homepage = "https://github.com/I-Want-ToBelieve/autohide-tdrop";
    mainProgram = pname;
    license = licenses.gpl3Only;
  };
}

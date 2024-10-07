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
  version = "1.1.4";

  src = fetchFromGitHub {
    owner = "I-Want-ToBelieve";
    repo = pname;
    rev = "main";
    hash = "sha256-JkCgvlN9uHltyc+GMHTo+VHZRwKpGMU6hwvL49tpd7U=";
  };

  cargoHash = "sha256-pF83PKfi6aVglg+XsU3cIyaf8JT6HBQlB0oVHJokvlM=";

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

{
  stdenv,
  lib,
  fetchFromGitHub,
  ...
} @ args:
# @see https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/fcitx5-breeze/default.nix
# @see https://github.com/catppuccin/fcitx5
stdenv.mkDerivation rec {
  name = "systemd-shutdown-diagnose";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "farseerfc";
    repo = "systemd-shutdown-diagnose";
    rev = "master";
    sha256 = "sha256-l6o2hLCmkv/P98XBzwtB6boEciMGIlKWfVsYRId4WDM=";
  };
  installPhase = ''
    install -Dm755 diagnose.shutdown "$out/usr/lib/systemd/system-shutdown/diagnose.shutdown"
    install -Dm755 start-diagnose-shutdown "$out/usr/bin/start-diagnose-shutdown"
    install -Dm755 analyze-shutdown "$out/usr/bin/analyze-shutdown"
    install -Dm644 shutdown-diagnose.service "$out/usr/lib/systemd/system/shutdown-diagnose.service"
  '';
  meta = with lib; {
    description = "help to diagnose shutdown sequence for systemd";
    homepage = "http://github.com/farseerfc/systemd-shutdown-diagnose";
    license = licenses.gpl2Only;
  };
}

{ pkgs, terminal }:
let
  colors = import ../setup/colors.nix;
  rofi-config = import ./rofi-conf.nix {
    inherit colors terminal;
  };
  rofi-config-file = pkgs.writeTextFile {
    name = "technomancer-rofi.config";
    text = rofi-config;
  };
in
pkgs.stdenv.mkDerivation {
  name = "rofiWrapper";
  buildInputs = [ pkgs.makeWrapper ];
  phases = [ "buildPhase" ];
  buildCommand = ''
    mkdir -p $out/bin
    makeWrapper "${pkgs.rofi}/bin/rofi" $out/bin/rofi --set XENVIRONMENT ${rofi-config-file} --add-flags "display-run λ"
  '';
}

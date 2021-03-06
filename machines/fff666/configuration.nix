{config, lib, pkgs, ...}:

with lib;

# FIXME duplicate
let
  sources = import <dotfiles/pinned> { inherit (pkgs) fetchgit lib; };
  username = "peel";
  hostName = "fff666";
in rec {
  # TODO no
  nixpkgs.overlays =
    let path = <dotfiles/overlays>; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                  (attrNames (readDir path)))
      ++ [ (import <nurpkgs-peel/overlay.nix>) ];

  # TODO nay
  networking.hostName = hostName;

  nix.maxJobs = lib.mkDefault 12;

  #FIXME
  environment.darwinConfig = <dotfiles/machines/fff666/configuration.nix>;
  system.stateVersion = 3;

  nix.nixPath = [
    "darwin-config=${environment.darwinConfig}"
    "darwin=${sources."nix-darwin"}"
    "nixpkgs=${sources.nixpkgs}"
    "dotfiles=$HOME/.config/nixpkgs"
    "nurpkgs-peel=${sources.nurpkgs}"
    "$HOME/.nix-defexpr/channels"
    "$HOME/.nix-defexpr"
  ];

  imports = let modules = (import <nurpkgs-peel/darwin-modules>); in [
    modules.bloop
    modules.yabai
    modules.weechat
    <dotfiles/setup/darwin>
  ];

}

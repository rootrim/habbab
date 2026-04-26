{
  description = "Habbab";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          # android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
      # androidSdk = pkgs.androidenv.androidPkgs.androidsdk;
    in {
      devShell = with pkgs;
        mkShell {
          # ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
          buildInputs = [
            flutter
            # androidSdk
            jdk17
          ];
        };
    });
}

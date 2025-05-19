{
  description = "My Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };

  outputs =
    { nixpkgs, nixos-hardware, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit pkgs;
        };
        modules = [
          nixos-hardware.nixosModules.framework-16-7040-amd
          ./hardware-configuration.nix
          ./configuration.nix
          ./modules/packages.nix
          ./modules/dev_tools/default.nix
          ./modules/hyprland.nix
        ];
      };
    };
}

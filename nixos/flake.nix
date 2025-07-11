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
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [

          (
            { config, ... }:
            {
              nixpkgs.config.allowUnfree = true;
            }
          )

          nixos-hardware.nixosModules.framework-16-7040-amd
          ./hardware-configuration.nix
          ./configuration.nix
          ./modules/packages.nix
          ./modules/hyprland.nix
          ./modules/keyboard.nix
          ./modules/dev_tools/default.nix
        ];
      };
    };
}

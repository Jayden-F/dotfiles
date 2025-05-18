{ config, lib, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        cargo
        rust-analyzer
    ];
}


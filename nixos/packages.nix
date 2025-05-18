{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kitty
        vim
        wget
        hyprpaper
        wofi
        hyprlock
        hypridle

        #other apps
        spotify
        discord
    ];

}

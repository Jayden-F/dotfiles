{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    spotify
    discord
    google-chrome
    zotero
  ];
}

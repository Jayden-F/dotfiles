{ pkgs, ...}:

{

    programs.hyprland.enable = true;
    programs.waybar.enable = true;

    environment.systemPackages = with pkgs; [
        kitty
        wget
        hyprpaper
        wofi
        hyprlock
        hypridle

    ];

}

{ config, lib, pkgs, ..} :
{
    environment.systemPackages = with pkgs; [
        neofetch
        btop
        ghostty
        tmux
        git
        ripgrep
        fzf
        fd
        linuxPackages_latest.perf
    ];

    imports = [
        ./cpp.nix
        ./go.nix
        ./python.nix
        ./rust.nix
        ./zig.nix
    ]
}


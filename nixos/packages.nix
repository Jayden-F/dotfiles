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

        # devtools
        neofetch
        btop
        ghostty
        tmux
        git
        ripgrep
        fzf
        fd
        linuxPackages_latest.perf


        # zig
        zig
        zls

        # rust
        cargo
        rust-analyzer

        # c/c++
        clang
        clang-tools
        bear
        gnumake
        cmake

        #python
        python313
        basedpyright
        ruff
        uv

        #go
        go

        #other apps
        spotify
        discord
    ];

}

{ pkgs, ... }:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    gdb
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
  ];
}

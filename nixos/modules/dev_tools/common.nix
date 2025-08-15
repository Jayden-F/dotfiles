{ pkgs, ... }:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    btop
    fd
    fzf
    linuxPackages_latest.perf
    gdb
    git
    ghostty
    lazygit
    ripgrep
    tmux
  ];

  imports = [
    ./cpp.nix
    ./go.nix
    ./python.nix
    ./rust.nix
    ./zig.nix
  ];
}

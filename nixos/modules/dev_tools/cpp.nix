{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    bear
    gnumake
    cmake
  ];
}

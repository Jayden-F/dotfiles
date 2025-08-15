{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    gnumake
    gtest
    cmake
    neocmakelsp
  ];
}

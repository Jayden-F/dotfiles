{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
        minizinc
        minizincide
  ];
}

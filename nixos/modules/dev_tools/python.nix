{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python313
    basedpyright
    ruff
    uv
  ];
}

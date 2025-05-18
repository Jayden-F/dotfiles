# Edit this configuration file to define what should be installed on
# your system. Help es available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{


    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Use the systemd-boot EFI boot loader.


    boot.kernelParams = [ "amdgpu.dcdebugmask=0x410" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

    # Set your time zone.
    time.timeZone = "Australia/Melbourne";

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Select internationalisation properties.
    # i18n.defaultLocale = "en_US.UTF-8";
    # console = {
    #   font = "Lat2-Terminus16";
    #   keyMap = "us";
    #   useXkbConfig = true; # use xkb.options in tty.
    # };

    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    # Configure keymap in X11
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.options = "caps:escape"; # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Enable sound.
    # hardware.pulseaudio.enable = true;
    # OR
    # services.pipewire = {
    #   enable = true;
    #   pulse.enable = true;
    # };

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jaydenf = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };

    programs.hyprland.enable = true;
    programs.waybar.enable = true;

    programs.firefox.enable = true;
    programs.thunderbird.enable = true;

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        interactiveShellInit = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        '';
        ohMyZsh = {
            enable = true;
            plugins = [ ];
            theme = "robbyrussell";
        };

    };
    programs.neovim = { enable = true; defaultEditor = true; };

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    system.stateVersion = "24.11";

}


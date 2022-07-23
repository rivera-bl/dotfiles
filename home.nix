{ lib, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
 /* home.username = "nixos"; */
  /* home.homeDirectory = "/home/nixos"; */

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  /* home.stateVersion = "22.05"; */

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERM = "alacritty";
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraConfig = builtins.readFile ./i3/config;
  };

  # not necessary if using enable = true
  /* home.packages = with pkgs; [ ]; */
  programs.tmux = {
    enable = true;
    extraConfig = lib.strings.fileContents ./tmux/tmux.conf;
  };
}

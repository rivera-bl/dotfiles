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
    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
    extraConfig = lib.strings.fileContents ./tmux/tmux.conf;
  };

  # could manage fish with configuration.nix since you can only set it as default shell there
  programs.fish = {
    enable = true;
    functions = {};
    plugins = [];

    interactiveShellInit = ''
      set fish_greeting ""
    '' +
    ''
      fish_vi_key_bindings
      bind -M default yy fish_clipboard_copy
      bind -M default Y fish_clipboard_copy
      bind -M default p fish_clipboard_paste
      bind -M insert -k nul accept-autosuggestion # ctrl-SPACE
    '';
    loginShellInit = "";
    shellInit = "";

    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/system/#";
      nrh = "home-manager switch --flake ~/nixos/home/#nixos";
    };
    shellAliases = {};
  };
}

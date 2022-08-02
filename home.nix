{ lib, config, pkgs, ... }:

{
  imports = [
    ./i3/i3.nix
    ./tmux/tmux.nix
    ./lazygit/lazygit.nix
    ./zsh/zsh.nix
    ./programs/starship.nix
    ./programs/alacritty.nix
    ./programs/fzf.nix
    ./programs/firefox.nix
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERM = "alacritty";
    SHELL = "zsh";
  };
    
  # not necessary if using enable = true
  /* home.packages = with pkgs; [ ]; */
}

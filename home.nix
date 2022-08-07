{ lib, config, pkgs, ... }:

{
  imports = [
    ./i3/i3.nix
    ./lazygit/lazygit.nix
    ./tmux/tmux.nix
    ./zsh/zsh.nix
    ./programs/alacritty.nix
    ./programs/git.nix
    ./programs/fzf.nix
    ./programs/firefox.nix
    ./programs/starship.nix
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

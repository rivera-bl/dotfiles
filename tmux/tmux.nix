{ pkgs, lib, ... }: {

  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;
    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
    extraConfig = lib.strings.fileContents ./tmux.conf;  
  };

}

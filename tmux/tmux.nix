{ pkgs, lib, ... }: {

  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      vim-tmux-navigator
      yank
      tmux-fzf
    ];
    extraConfig = lib.strings.fileContents ./tmux.conf;  
  };

}

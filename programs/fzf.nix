{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    /* enableFishIntegration = true; */
    # add bind to:
    # select multiple files -> space
    # select and run -> ctrl-l
    # select and edit -> enter
    defaultOptions = [ 
      "--height 40%"
      "--border none"
      "--layout reverse"
      "--info hidden"
      "--bind ctrl-j:down,ctrl-k:up,ctrl-l:accept"
    ];
    
    changeDirWidgetCommand = ""; # ALT-C
    changeDirWidgetOptions = [];

    fileWidgetCommand = "find -L"; # CTRL-T
    fileWidgetOptions = [];

    historyWidgetOptions = []; # CTRL-R

    # requires fzf-tmux plugins
    # useful for when managing multiple sessions/windows
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [
      "-p -w 62% -h 38% -m"
      ];
    };
  };

}

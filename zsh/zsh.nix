{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    defaultKeymap = "vicmd";

    enableAutosuggestions = true;
    enableCompletion = true; # environment.pathsToLink = [ "/share/zsh" ];
    enableSyntaxHighlighting = true;

    dirHashes = {
    };

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignorePatterns = [""];
      save = 10000;
      size = 10000;
    };

    #######################################
    # variables/files in order of execution
    #######################################
    # .zshenv
    envExtra = "setopt no_global_rcs";

    # .zprofile
    profileExtra = "";

    # .zshrc before completion init
    initExtraBeforeCompInit = "";
    completionInit= "
      autoload -U compinit
      compinit
      zmodload zsh/complist
      _comp_options+=(globdots)		# Include hidden files.

      source <(kubectl completion zsh)
      # https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
      source ~/nixos/home/zsh/_tmuxinator
      ";

    # TODO: split .zshrc here
    # .zshcr
    localVariables = {};
    initExtraFirst = "";
    initExtra = "
      ${builtins.readFile ./.zalias}
      ${builtins.readFile ./.zfunctions}
      zplug load
      # overwritten by zsh-abbr
      bindkey '\\0' forward-char # accept-autosuggestion
      clear # fix
    ";

    # .zlogin
    loginExtra = "";

    # .zlogout
    logoutExtra = "";

    # ?before or after zsh
    sessionVariables = {};

    shellAliases = {};
    shellGlobalAliases = {};

    zplug = {
      # zplugHome = "~/.config/zsh/.zplug/"; # has to be of type path
      enable = true;
      plugins = [
        { name = "bonnefoa/kubectl-fzf"; tags = [ defer:3 ]; }
        { name = "olets/zsh-abbr"; }
        { name = "zsh-users/zsh-syntax-highlighting"; tags = [ defer:2 ]; }
      ];
    };

    plugins = [
    /* { */
    /*    # will source zsh-autosuggestions.plugin.zsh */
    /*    name = "zsh-autosuggestions"; */
    /*    src = pkgs.fetchFromGitHub { */
    /*      owner = "zsh-users"; */
    /*      repo = "zsh-autosuggestions"; */
    /*      rev = "v0.4.0"; */
    /*      sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc"; */
    /*      }; */
    /*    } */
    ];

    # various ohmyzsh options
  };
}

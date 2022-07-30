{ lib, config, pkgs, ... }:

{
  # less home-configuration.nix search for /programs\.<pkg>
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERM = "alacritty";
    SHELL = "zsh";
  };
    
  # better to manage system-wide? keys may differ between machines
  xsession.windowManager.i3 = {
    config.terminal = "alacritty";
    enable = true;
    package = pkgs.i3-gaps;
    config.bars = [];
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
    enable = false;
    functions = {
      fish_greeting = "";

      bangbang =
        "if test \"$argv\" = !!
          eval command sudo $history[1]
        else
          command sudo $argv
        end";

      bang =
        "switch (commandline -t)
          case \"!\"
              commandline -t $history[1]; commandline -f repaint
          case \"*\"
              commandline -i !
        end";

      dollar =
        "switch (commandline -t)
          case \"!\"
              commandline -t \"\"
              commandline -f history-token-search-backward
          case \"*\"
              commandline -i '$'
        end";

      bash_function = 
        "bash -c 'echo \"hola\"'";

     /* function fzf-complete -d 'fzf completion and print selection back to commandline' */
	# As of 2.6, fish's "complete" function does not understand
	# subcommands. Instead, we use the same hack as __fish_complete_subcommand and
	# extract the subcommand manually.
      fzf-complete = 
        "set -l cmd (commandline -co) (commandline -ct)
        switch $cmd[1]
          case env sudo
            for i in (seq 2 (count $cmd))
              switch $cmd[$i]
                case '-*'
                case '*=*'
                case '*'
                  set cmd $cmd[$i..-1]
                  break
              end
            end
        end
        set cmd (string join -- ' ' $cmd)

        set -l complist (complete -C$cmd)
        set -l result
        string join -- \\n $complist | sort | eval (__fzfcmd) -m --select-1 --exit-0 --header '(commandline)' | cut -f1 | while read -l r; set result $result $r; end

        set prefix (string sub -s 1 -l 1 -- (commandline -t))
        for i in (seq (count $result))
          set -l r $result[$i]
          switch $prefix
            case \"'\"
              commandline -t -- (string escape -- $r)
            case '\"'
              if string match '*\"*' -- $r >/dev/null
                commandline -t --  (string escape -- $r)
              else
                commandline -t -- '\"'$r'\"'
              end
            case '~'
              commandline -t -- (string sub -s 2 (string escape -n -- $r))
            case '*'
              commandline -t -- (string escape -n -- $r)
          end
          [ $i -lt (count $result) ]; and commandline -i ' '
        end

        commandline -f repaint";

      /* fzf-kubectl = */ 
      /*   "bash -c */
      /*   command -v fzf >/dev/null 2>&1 && { */ 
      /*   source <(kubectl completion bash | sed 's#\"${requestComp}\" 2>/dev/null#\"${requestComp}\" 2>/dev/null | head -n -1 | fzf  --multi=0 #g') */
      /*   }"; */
        };

    plugins = [
     {
       name = "fish-kubectl-completions";
       src = pkgs.fetchFromGitHub {
         owner = "evanlucas";
         repo = "fish-kubectl-completions";
         rev = "ced676392575d618d8b80b3895cdc3159be3f628";
         sha256 = "sha256-OYiYTW+g71vD9NWOcX1i2/TaQfAg+c2dJZ5ohwWSDCc=";
       };
     }
    ];

    interactiveShellInit = ''
      fish_vi_key_bindings
      bind -M default yy fish_clipboard_copy
      bind -M default Y fish_clipboard_copy
      bind -M default p fish_clipboard_paste
      bind -M insert -k nul accept-autosuggestion # ctrl-SPACE
      bind -M insert ! bang
      bind -M insert '$' dollar
      bind -M insert \cx bash_function
      bind -M insert \t fzf-complete
    '';
    loginShellInit = "";
    shellInit = "";

    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/system/#";
      nrh = "home-manager switch --flake ~/nixos/home/#nixos";
    };
    shellAliases = {
      nix-shell = "nix-shell --command 'fish'";
      k = "kubectl";
    };
  };

  programs.starship = {
    # ( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' ) 
    enable = true;
    /* enableFishIntegration = true; */
    enableZshIntegration = true;

    settings = {
      format = "
[┌───────────────────>](bold green)
[│](bold white) $nix_shell$directory
[└─>](bold green) ";
      right_format = "$cmd_duration";
      add_newline = false;
      line_break = { disabled = true; };

      #############################
      ### Essentials
      #############################

      cmd_duration = {
        format = "[$duration]($style)";
        show_notifications = false;
      };

      username = {
        disabled = true;
        format = "[$user]($style)";
      };

      hostname = {
        style = "fg:62";
        ssh_only = true;
        format = "[$ssh_symbol](bold blue)[@]($style)[$hostname]($style)[:]($style) ";
        trim_at = ".companyname.com";
      };

      directory = {
        style = "fg:47";
        read_only = "";
        format = "[$path]($style) ";
      };

      git_branch = {
        style = "fg:62";
        format = "$symbol[\\[$branch(:$remote_branch)\\]]($style)";
      };

      git_status = {
        style = "bold yellow";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
      };

      character = {
       success_symbol = "[>](bold white)";
       error_symbol = "[x](bold red)";
       vicmd_symbol = "[>](bold green)";
      };

      nix_shell = {
        format = "[$symbol]($style)";
        impure_msg = "";
        symbol = " ";
        style = "bold blue dimmed";
      };

      #############################
      ### Languages
      #############################
      
      lua = { disabled = true; };
      nodejs = { disabled = true; };
      terraform = { disabled = true; };
      kubernetes = { disabled = true; };
      c = { disabled = true; };
      
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {

      window = {
        padding = {
          x = 8.0;
          y = 6.0;
        };
        opacity = 1.0;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      
      selection = {
        save_to_clipboard = false;
      };

      font = {
        size = 7.0;
        draw_bold_text_with_bright_colors = false;
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
        bold_italic = {
          family = "monospace";
          style = "Bold Italic";
        };
        glyph_offset = {
          x = 0.0;
          y = 0.0;
        };

        colors = {
          primary = {};
          cursor = {};
          vi_mode_cursor = {};
          line_indicator = {};
          footer_bar = {};
          selection = {};
          search = {};
          hints = {};
          normal = {};
          bright = {};
          dim = {};
        };

        bell = {};

      };
    };
  };

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

    fileWidgetCommand = ""; # CTRL-T
    fileWidgetOptions = [];

    historyWidgetOptions = []; # CTRL-R

    # requires fzf-tmux plugins
    # useful for when managing multiple sessions/windows
    tmux = {
      enableShellIntegration = false;
      shellIntegrationOptions = [];
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    defaultKeymap = "vicmd";

    enableAutosuggestions = true;
    enableCompletion = true; # environment.pathsToLink = [ "/share/zsh" ];
    enableSyntaxHighlighting = true;

    dirHashes = {
      hom = "$HOME/nixos/home/";
      xom = "$HOME/nixos/system/";
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
      ";

    # TODO: split .zshrc here
    # .zshcr
    localVariables = {};
    initExtraFirst = "";
    initExtra = "
      ${builtins.readFile ./zsh/.zalias}
      ${builtins.readFile ./zsh/.zfunctions}
      zplug load
      # overwritten by zsh-abbr
      bindkey '\\0' forward-char # accept-autosuggestion
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
      zplugHome = ~/.config/zsh/.zplug;
      enable = true;
      plugins = [
        { name = "bonnefoa/kubectl-fzf"; tags = [ defer:3 ]; }
        { name = "olets/zsh-abbr"; }
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

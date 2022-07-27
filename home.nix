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
    enable = true;
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
    };

    plugins = [];

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
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      # format = "$nix_shell$all";
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
        ssh_only = false;
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
    enableFishIntegration = true;
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
}

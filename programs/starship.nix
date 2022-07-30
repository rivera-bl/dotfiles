{
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

}

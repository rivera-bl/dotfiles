{
  programs.git = {
    enable = true;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
    };
    userName = "Pablo";
    userEmail = "pablorivera";
    extraConfig = {
      init.defaultBranch = "main";
      url."https://github.com/".insteadOf = "git://github.com/";
    };
    ignores = [ ".direnv" "result" ];
  };
}

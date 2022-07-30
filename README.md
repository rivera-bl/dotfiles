## Home programs

### Discovery

#### home-manager

- Standalone advantages:
  - not spam my system with multiple boot entries
  - avoid having to `nixos-rebuild --switch` constantly (but have to home-manager --switch)
  - If I ever want to include home-manager in my configuration.nix I can just convert it into a flake and pass it as an input.

- Nonetheless I can, as stated in [this comment][4], symlink their config files to `XDG_CONFIG_HOME` and don't require a rebuild to update, while keeping all of my configuration in a single place:
```nix
home.file = { 
    ".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink ./init.el;
    ".emacs.d/early-init.el".source = config.lib.file.mkOutOfStoreSymlink ./early-init.el; 
};
```

- Either way should keep most programs installed with home-manager in a separate file, so we can import them by demand to the system config, and try out new programs in a safer way
- The ammount of documentation for the usage and program options is a breeze. I wonder if we can use the same options provided by home-manager in the pkgs installed directly by NixOS, for ex. alacritty. At least doing a glimpse at tmux in nixpkgs it does have the same options.

- Will manage every program system-wide, if I get into issues will try home-manager.
- Although I will use external config files to configure them as a start, because I already have many programs configured this way, configuring with nix language could be useful to traverse a variable across many programs.

- It is true that I will mess my generations with all this changes, the only way not do that and keep my config in a separate file is placing the config files in XDG_CONFIG_HOME

- In configuration.nix if I set inside the programs the option of `enabled = false;` then the other options will be skipped, this way we can manage the configurations thorough XDG_CONFIG_HOME

- Some programs should be installed system-wide like `fish` so they can be used by root too

### Conclusion

- Advantages of hm:
    - some programs have more options like `fish`
    - separation of concerns
    - don't mess with system wide generations
    - nix language is really helpful when managing plugins, for example with tmux or nvim, no overhead
    - ?it is the standard used by jonringer and Misterio77

- Usage of hm:
    - standalone with flake
    - on its own folder/git called home
    - every program on its own file

- Fallbacks:
    - I if ever need to merge build the system with home-manager included I can add the flake as an input
    - If doing a lot of changes and testing I could use `config.lib.file.mkOutOfStoreSymlink` temporarily

- After a bit of usage I can say:
    - hm build takes half the time of nixos-rebuild

### Installation

- Test the tool:
```
nix-shell -p home-manager
mkdir /tmp/test-homemanager && cd !$
touch home.nix
home-manager -f home.nix switch
home-manager uninstall
```

- Install with flake:
```
# create a home.nix
# create a flake.nix
nix build --no-link .#homeConfigurations.jdoe.activationPackage
"$(nix path-info .#homeConfigurations.jdoe.activationPackage)"/activate
home-manager switch --flake .#nixos
man home-configuration.nix
```

- Configuration of `flake.nix` has to be like [this][10], not with the values on [`home.nix`][3]. Although it has been removed in [22.11 release][11]

## TODO

- [x] test home-manager with nix-shell
    - [x] decide wheter `rebuild` is fast enough for experimentation, if not should use mkOutOfStoreSymlink
    - wasn't so bad so will build the programs with their config files
- [x] create a basic home.nix
- [x] install home-manager standalone with flake
- [x] move home-manager README section to home repo
- [ ] document copy-paste solution mouse/shell/vim
    - tmux-yank
    - fish -M default clipboard
    - X xsel xclip
    - [ ] find a solution to copy through ssh
- [ ] move every program to their own file
- [x] fix X copy/paste not working, like if X wasn't running, but systemctl status display-manager.service says it is indeed running, this happens when starting X automatically with the display-manager of lightdm
  - check for options via `man configuration.nix`
!- [ ] install a font to render glyphs
- [ ] show notifications when long running commands finish
- [x] fix keys:
    - [x] change layout to be able to use < >
    - [x] prtsc to be mod
    - [x] faster scroll back with keys
    - ! [ ] make a key Ñ
        - can use the FN as compose key
        - or i could go back to the latam layout and use this FN to compose < >, but it would be on a very awkward spot
!- [ ] configure colorscheme system-wide with nix-colors
    - i3, alacritty, startship, fish, neovim
- [ ] change docker for podman
 - [ ] install every home program, the goal is to migrate every program I currently use so it is available in case I ever want to go back
    - [ ] neovim
        - for now install as a flake
        - [ ] install telescope dependencies
        - [ ] install autoformater for nix
    - [x] tmux
        - [x] install plugins
        - [x] install yank plugin to copy to clipboard
        - [ ] install kube-context plugin to show on powerline
        - [ ] find a way to show the current ip of the machine we are connected to on that pane
    - [x] xclip (system wide)
    - [x] fish
        - [x] create abbr to build hm and nixos faster
        - [x] vi mode
        - [x] paste between shell and vim
        - [x] paste from tmux mouse selection to clipboard, so we can use it with `p` on console and vim with tmux-yank
        - [x] create some [functions][12]
        - [x] autocomplete suggestions with ctrl-SPACE 
        - [x] how to make available !$ and !!
    - [x] install kubectl,minikube to test fzf-kubectl
    - [x] zsh learn files importing order
        - at system
    - [x] zsh install plugins
        - [x] kubectl fzf
            - test with a cluster, terra cenco
        - [x] abbrev
        - [x] docker completion
        - [x] fish autosuggestions
          - accept CTRL-SPACE
    - [x] manage the aliases with .zalias
    - [ ] replace lazygit/add new tool for diff
        - needs full vertical side by side cherrypicking
    - [x] zsh add --> twisting line to prompt
        - check starship docs
        - check newm video
    - [ ] get colored output from kubectl,docker and ls
    - [ ] install fzf plugins
        - [ ] tmuxinator
    - [ ] zsh copy-paste between zsh and vim
    - [ ] zsh manage scripts and source by folders
        - [ ] functions
        - [ ] alias
        - [ ] .sh .z* or extensionless?

    - [ ] configure less
        - [ ] mouse scrolling
    - [ ] alias for kubectl actions: kd,kg,kx
        - would get really fast with fzf-kubectl
    - [ ] install aws-cli
        - have to create an overlay and package, not in nixpkgs
    - [x] download home-manager github
    - [x] download nixpkgs github
    - [x] [starship][14]
        - configure for:
            - [x] prompt
            - [x] nix-shell
    - [x] alacritty
        - [x] configure
        - [ ] improve tmux integration
            - why the cursor blinks in alacritty but not inside of tmux?
!    - [x] i3
        - [x] solve .xinitrc
        - [ ] move i3config to nix
        - [ ] fix that starts on window n10
        - [ ] install i3blocks
    - [x] fzf
        - [x] configure to use with fish ctrl-R
        - [ ] find a way to select and execute command with one key
            - most of the cool functions are already written in bash
            - execute a bash script within a fish function with `bash -c ''`
    - [ ] mpd
    - [ ] ncmpcpp
    - [ ] zathura
    - [ ] zeal
    - [ ] lazygit
      - [ ] configure mappings
    - [ ] zsh
- [ ] test out alacritty multiplexing mode
    - i don't think it will be better than tmux
- [ ] install rust tools that improve cli workflow
- [ ] eventually I would like to create a nixos-module and a flake with my console-drive development environment
    - this would be composed of `fzf` `shell` `tmux` `starship` `?font`
      - the shell for now will be `fish`
      - `nvim` will not be included because it is a very opiniated tool
      - the terminal either because it offers little functionality for this use
          - a terminal like `alacritty` can't be run on a non-graphical environment
          - the user who would try this module/flake will have it's own terminal

[1]: https://github.com/Mic92/dotfiles/tree/master/nixos
[2]: https://nix-community.github.io/home-manager/index.html#sec-flakes-nixos-module 
[3]: https://nix-community.github.io/home-manager/index.html#sec-usage-configuration
[4]: https://nix-community.github.io/home-manager/options.html
[5]: https://www.reddit.com/r/NixOS/comments/vc3srj/comment/iccqxw1/
[6]: https://github.com/Misterio77/nix-starter-config 
[7]: https://nix-community.github.io/home-manager/index.html#sec-flakes-standalone 
[8]: https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a
[9]: https://www.nushell.sh/
[10]: https://github.com/nix-community/home-manager/issues/2073
[11]: https://github.com/nix-community/home-manager/blob/master/flake.nix#L30-L33 
[12]: https://fishshell.com/docs/current/cmds/function.html
[13]: https://github.com/fish-shell/fish-shell/issues/4028 
[14]: https://starship.rs/config/
[15]: https://starship.rs/config/#style-strings
[16]: https://discourse.nixos.org/t/opening-i3-from-home-manager-automatically/4849/10
[17]: https://github.com/alacritty/alacritty/blob/master/alacritty.yml
[18]: https://github.com/jesseduffield/lazygit/blob/master/docs/Config.m
[19]: https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e 

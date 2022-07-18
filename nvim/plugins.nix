{
  pkgs,
  lib,
  ...
}: let customPlugins = {
  vim-bufsurf = pkgs.vimUtils.buildVimPlugin rec {
    pname = "vim-bufsurf";
    version = "v0.3";
    src = pkgs.fetchFromGitHub {
      owner = "ton";
      repo = "vim-bufsurf";
      rev = "e6dbc7ad66c7e436e5eb20d304464e378bd7f28c";
      sha256 = "sha256-o/Uf4bnh3IctKnT50JitTe5/+BUrCyrlOOzkmwAzxLk=";
    };
    meta.homepage = "https://github.com/ton/vim-bufsurf";
  };
  nvim-lsp-installer = pkgs.vimUtils.buildVimPlugin rec {
    pname = "nvim-lsp-installer";
    # doesn't have any release
    version = "v0.1";
    dontBuild = true;
    dontCheck = true;
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "nvim-lsp-installer";
      rev = "793f99660fa9212f52ee8b6164454e03ba1f42c9";
      sha256 = "sha256-BTlDOCJZt8wIzRbyD44Scr5nv/M0LSMA5mZjYiip1iM=";
    };
    meta.homepage = "https://github.com/williamboman/nvim-lsp-installer";
  };
};
in { 
  myPlugins = with pkgs.vimPlugins; [
    # completion:
    nvim-cmp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-nvim-lsp
    cmp_luasnip
    # snippets:
    luasnip
    vim-snippets
    # lsp:
    nvim-lspconfig
    customPlugins.nvim-lsp-installer
    # fuzzy search
    popup-nvim
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    # looks:
    nvim-web-devicons
    lualine-nvim
    colorbuddy-nvim #?
    # functions:
    tabular
    vim-wordmotion
    vim-commentary
    vim-eunuch
    vim-obsession
    auto-pairs
    customPlugins.vim-bufsurf
    # external:
    zeavim-vim
    lazygit-nvim
    vim-tmux-navigator
    vimux
    # misc:
    which-key-nvim
    indent-blankline-nvim
    # highlight:
    vim-markdown
    vim-terraform
    nvim-colorizer-lua

    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          tree-sitter-nix
          tree-sitter-bash
          tree-sitter-json
          tree-sitter-yaml
          tree-sitter-go
          tree-sitter-regex
          tree-sitter-dockerfile
          tree-sitter-python
        ]
    ))
  ];
}

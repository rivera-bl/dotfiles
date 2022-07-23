{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
        inherit pkgs system;
        configuration = ./home.nix;
        homeDirectory = "/home/nixos";
        username = "nixos";
        stateVersion = "22.05";

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        /* modules = [ */
        /*   ./home.nix */
        /* ]; */

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

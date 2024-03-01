{
  description = "Roman's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixd requires it to support flake installations.
    flake-compat = {
      url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, agenix, home-manager, ... }:
    let
      system = "x86_64-darwin";
      machine = "macbook-pro-i7";
      user = "roman";
    in
    {
      darwinConfigurations.${machine} = darwin.lib.darwinSystem {
        inherit system;

        modules = [
          ./users/${user}/darwin.nix
          ./users/${user}/machine.nix
          agenix.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./users/${user}/home.nix;
          }
          {
            nixpkgs.hostPlatform = "${system}";
          }
        ];
      };

      darwinPackages = self.darwinConfigurations.${machine}.pkgs;
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
    };
}

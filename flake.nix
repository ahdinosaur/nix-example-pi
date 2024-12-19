{
  description = "2024-12-18 Nix cross-compile issue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.11";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "aarch64-linux";
      specialArgs = {
        inherit system inputs;
      };
    in rec {
      nixosConfigurations.test = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;
        modules = [
          {
            system.stateVersion = "24.11";
          }
          {
            nixpkgs.buildPlatform = builtins.currentSystem;
            nixpkgs.hostPlatform = system;
          }
        ];
      };
      vm.test = nixosConfigurations.test.config.system.build.vm;
    };
}

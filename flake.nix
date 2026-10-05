{
  description = "Flake for the Evariste website. Includes Hugo and Mathjax.";

  inputs = { nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

  outputs = inputs@{ nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs-unstable.legacyPackages.${system};
    in {
      devShells.${system}.default =
        pkgs.mkShell { packages = with pkgs; [ hugo tailwindcss_4 ]; };
    };
}

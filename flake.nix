{
  description = "A Nix flake for Project Hollowpoint with nixvim's devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:ionthedev/NixVim-Configuration";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixvim, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    nvim = nixvim.packages.${system}.default;  # Reference the Neovim package from nixvim
  in {
    devShells = {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          cmake          # CMake for your project
          gcc            # GCC for C++ compilation
          python310Full  # Python 3.10
          godot_4        # Godot engine
          ninja          # Add Ninja build tool
          git
          pkg-config
          autoPatchelfHook
          nvim
        ];

        runtimeDependencies = with pkgs; [
          mesa
          xorg.libX11
          xorg.libXcursor
          xorg.libXext
          xorg.libXi
          xorg.libXrandr
          vulkan-loader
          libGL
          wayland
          wayland-utils
          # Neovim from nixvim
        ];

        shellHook = ''
          echo "DevShell ready with Neovim, Ninja, CMake, and other tools!"
          nvim --version
        '';
      };
    };

    # Ensure we expose the default package for Neovim
    packages = {
      default = nvim;
    };
  });
}


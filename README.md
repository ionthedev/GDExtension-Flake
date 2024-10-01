# GDExtension-Flake

This flake is designed to work as a reproducable development environment for creating extensions for the Godot Engine in C++. 

This flake is based on the CMake template @ZacharieBeauchemin created for GDExtension to be used with CLion. As I am attempting to personally switch from CLion to nvim as
well as recently making the jump to NixOS, I felt it would be a great project to become familiar with Nix-Shell's and better understand how flakes can be used to create 
development environments.

Note! Godot won't be able to run in the shell unless you have the godot_4 package from the nix-unstable channel. With that, even if you have it and run `sudo nix develop`, godot_4 will not be able to start. 
If anyone knows how to fix this then please make a pull request so the community can benefit from your extremely massive brain.

### Requirements:
    Linux with Nix installed with nix commands and flakes enabled. 

### The DevShell contians the following packages

 - nvim - This Flake uses my custom configured NixVim natively with plugins already installed and configured. 
 - cmake - because I personally despise using SCons.
 - gcc - Feel free to replace this with Clang if you wish.
 - godot - Version 4.3 from the nix-unstable channel.
 - ninja - My prefered build tool.
 - git - needed for the cmake scripts to fetch content properly.
 

### Instructions:
To use this template, either clone or download it; truly do whatever your heart desires to grab it.
open terminal in the repo's directory.
OPTIONAL: Change the ProjectName in the CMakeLists.txt to whatever you please, this will be used for your libraries name.

1. run `nix develop`
2. cmake -G Ninja -DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++) ..
3. when that's all done, run `ninja` and it should start compiling the provided GDExtension and GodotCPP for godot 4.3
4. Source code for the extension will live in the "game" folder.
5. Star this repo template 😈


## Credits:

Zacharie Beauchemin - for making an absolutely FIRE template. - https://github.com/ZacharieBeauchemin/gdextension_cmake_template
The NixOS community - for always keeping the bleeding edge bleeding. - https://github.com/nix-community
Vimjoyer - made the switch to nvim and nix extremely smooth - https://www.youtube.com/@vimjoyer
The Godot Foundation - Creating a fantastic environment to work in, big shout out to the GDExtension team.



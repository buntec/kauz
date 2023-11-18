# Kauz

*This is work in progress!*

A colorscheme for neovim built with [Lush](https://github.com/rktjmp/lush.nvim).
Includes matching themes for kitty, fish and tmux.

## Install

Kauz is distributed as a nix flake exposing a [home-manager](https://github.com/nix-community/home-manager) module.

- Add `overlays.default` to your list of `nixpkgs` overlays.
- Import `homeModules.default` as a home-manager module and activate by setting `colorschemes.kauz.enable = true`.

## Acknowledgements:

Utilities for generating tmux, fish and kitty configurations
are taken from [Tokyo Night](https://github.com/folke/tokyonight.nvim).

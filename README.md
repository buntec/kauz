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

## Screenshots

### Scala (with Treesitter)

<img width="1728" alt="kauz-screenshot-1" src="https://github.com/buntec/kauz/assets/28229664/c417eb02-0731-4652-aa2e-6165d7f600aa">

### Nix

<img width="1728" alt="kauz-nix-screenshot-1" src="https://github.com/buntec/kauz/assets/28229664/e24d8de7-de5c-4382-b299-ee204e50efab">

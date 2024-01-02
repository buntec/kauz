# Kauz 🦉

*This is work in progress!*

A colorscheme for neovim built with [Lush](https://github.com/rktjmp/lush.nvim).
Includes matching themes for kitty, fish and tmux.

## Install

### Nix

Kauz is distributed as a nix flake exposing a [home-manager](https://github.com/nix-community/home-manager) module.

- Add `overlays.default` to your list of `nixpkgs` overlays.
- Import `homeModules.default` as a home-manager module and activate the theme by enabling the corresponding option.
For example, enable the theme for fish by setting: 
```nix
kauz.fish.enable = true;
#kauz.kitty.enable = true;
#kauz.neovim.enable = true;
#kauz.tmux.enable = true;
```
### Without Nix

```lua
-- lazy.nvim
{
  "buntec/kauz",
  dependencies = { "rktjmp/lush.nvim" }
}
```

```lua
vim.cmd.colorscheme("kauz")
```


## Acknowledgements:

Utilities for generating tmux, fish and kitty configurations
are taken from the gorgeous [Tokyo Night](https://github.com/folke/tokyonight.nvim).

## Screenshots

### Scala

<img width="1728" alt="kauz-screenshot-1" src="https://github.com/buntec/kauz/assets/28229664/c417eb02-0731-4652-aa2e-6165d7f600aa">

### Nix

<img width="1728" alt="kauz-nix-screenshot-1" src="https://github.com/buntec/kauz/assets/28229664/e24d8de7-de5c-4382-b299-ee204e50efab">

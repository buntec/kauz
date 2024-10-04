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

<img width="1840" alt="Screenshot 2024-10-04 at 17 35 49" src="https://github.com/user-attachments/assets/3899efaa-c069-4b75-a72d-812c8dcba440">
<img width="1840" alt="Screenshot 2024-10-04 at 17 16 15" src="https://github.com/user-attachments/assets/56ba3e7c-6c79-4649-938e-2eb48fd9b8d1">


### Nix

<img width="1840" alt="Screenshot 2024-10-04 at 17 36 58" src="https://github.com/user-attachments/assets/5d91f05d-6d78-4c66-a29c-b6461efb22f0">
<img width="1840" alt="Screenshot 2024-10-04 at 17 21 42" src="https://github.com/user-attachments/assets/0fa604b9-6f8b-451f-a5e4-10a92e4506ec">

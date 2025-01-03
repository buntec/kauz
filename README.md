# Kauz 🦉

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
<img width="1728" alt="Screenshot 2025-01-03 at 16 29 04" src="https://github.com/user-attachments/assets/a98ebfd0-80a6-41d7-8ace-36db588e5492" />
<img width="1728" alt="Screenshot 2025-01-03 at 16 42 30" src="https://github.com/user-attachments/assets/f9267751-b651-4c4f-ad4f-59d9b23b43cf" />

### Nix
<img width="1728" alt="Screenshot 2025-01-03 at 16 27 47" src="https://github.com/user-attachments/assets/f3be4ba3-1884-4ac7-aef2-ed40e0c0134f" />
<img width="1728" alt="Screenshot 2025-01-03 at 16 41 30" src="https://github.com/user-attachments/assets/24e7cbd3-7fc1-4d33-ba18-6d2e5d83995a" />

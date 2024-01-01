{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.colorschemes.kauz;
  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {

  options.colorschemes.kauz = {
    # fish
    fish.enable = mkEnableOption "fish colorscheme integration";

    # kitty 
    kitty.enable = mkEnableOption "tmux colorscheme integration";

    # tmux 
    tmux.enable = mkEnableOption "tmux colorscheme integration";

    #neovim
    neovim.enable = mkEnableOption "neovim colorscheme integration";
  };

  config = mkIf isKitty {

    programs.kitty.extraConfig = ''
      include ${pkgs.kauz-kitty}/kauz.conf
    '';
  } // mkIf isTmux {
    programs.tmux.extraConfig = builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";
  } // mkIf isFish {
    programs.fish.plugins = [{
      name = "kauz-fish";
      inherit (pkgs.kauz-fish) src;
    }];
  } // mkIf isNeovim {

    programs.neovim.plugins = [ pkgs.kauz-nvim ];

    programs.neovim.extraLuaConfig = ''
      vim.cmd.colorscheme("kauz")
    '';
  };

}


{ lib, pkgs, config, ... }:
with lib;

let
  cfg = config.kauz;

  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {

  options.kauz = {
    fish.enable =
      mkEnableOption "Whether to enable the Kauz colorscheme for Fish";
    kitty.enable =
      mkEnableOption "Whether to enable the Kauz colorscheme for Kitty";
    tmux.enable =
      mkEnableOption "Whether to enable the Kauz colorscheme for Tmux";
    neovim.enable =
      mkEnableOption "Whether to enable the Kauz colorscheme for Neovim";
  };

  config = mkMerge [
    (mkIf isFish {
      programs.fish.plugins = [{
        name = "kauz-fish";
        inherit (pkgs.kauz-fish) src;
      }];
    })
    (mkIf isKitty {
      programs.kitty.extraConfig = ''
        include ${pkgs.kauz-kitty}/kauz.conf
      '';
    })
    (mkIf isTmux {
      programs.tmux.extraConfig =
        builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";
    })
    (mkIf isNeovim {
      programs.neovim.plugins = [ pkgs.kauz-nvim ];
      programs.neovim.extraLuaConfig = ''
        vim.cmd.colorscheme("kauz")
      '';
    })
  ];

}


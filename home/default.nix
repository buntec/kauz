{ lib, pkgs, config, ... }:
with lib;

let
  cfg = config.kauz;

  isLight = cfg.light;
  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

  fish-plugin = if isLight then pkgs.kauz-fish-light else pkgs.kauz-fish;

  variant = if isLight then "kauz-light" else "kauz";

in {

  options.kauz = {

    light = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use the light version of Kauz";
    };

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
        inherit (fish-plugin) src;
      }];
    })
    (mkIf isKitty {
      programs.kitty.extraConfig = ''
        include ${pkgs.kauz-kitty}/${variant}.conf
      '';
    })
    (mkIf isTmux {
      programs.tmux.extraConfig =
        builtins.readFile "${pkgs.kauz-tmux}/${variant}.tmux";
    })
    (mkIf isNeovim {
      programs.neovim.plugins = [ pkgs.kauz-nvim ];
      programs.neovim.extraLuaConfig = ''
        vim.cmd.colorscheme("${variant}")
      '';
    })
  ];

}


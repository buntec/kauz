{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.kauz;

  supported = [ "fish" "kitty" "neovim" "tmux" ];

  capitalizeFirst = s:
    lib.toUpper (builtins.substring 0 1 s)
    + builtins.substring 1 (lib.stringLength s) s;

  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {

  options.kauz = builtins.listToAttrs (map (s: {
    name = s.enable;
    value = mkEnableOption
      "Whether to enable the colorscheme for ${capitalizeFirst s}";
  }) supported);

  config = mkIf isFish {
    programs.fish.plugins = [{
      name = "kauz-fish";
      inherit (pkgs.kauz-fish) src;
    }];
  } // mkIf isKitty {
    programs.kitty.extraConfig = ''
      include ${pkgs.kauz-kitty}/kauz.conf
    '';
  } // mkIf isTmux {
    programs.tmux = ''
      builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";
    '';
  } // mkIf isNeovim {
    programs.neovim.plugins = [ pkgs.kauz-nvim ];
    programs.neovim.extraLuaConfig = ''
      vim.cmd.colorscheme("kauz");
    '';
  };

}


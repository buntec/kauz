{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.colorschemes.kauz;
  supported = [ "fish" "kitty" "neovim" "tmux" ];
  enabled = builtins.filter (s: cfg.${s}.enable) supported;
  capitalizeFirst = s:
    lib.toUpper (builtins.substring 0 1 s)
    + builtins.substring 1 (lib.stringLength s) s;

in {

  options.colorschemes.kauz = builtins.listToAttrs (builtins.map (s: {
    name = s.enable;
    value = mkEnableOption "Whether to enable the colorscheme for ${capitalizeFirst s}";
  }) supported);

  config = builins.listToAttrs (builtins.map (isEnabled: {
    name = "programs.${isEnabled}";
    value =

      if isEnabled == "kitty" then {
        extraConfig = ''
          include ${pkgs.kauz-kitty}/kauz.conf
        '';
      }

      else if isEnabled == "tmux" then {
        extraConfig = ''
          builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";
        '';

      }

      else if isEnabled == "fish" then {
        plugins = [{
          name = "kauz-fish";
          inherit (pkgs.kauz-fish) src;
        }];

      }

      else if isEnabled == "neovim" then {
        plugins = [ pkgs.kauz-nvim ];
        extraLuaConfig = ''
          vim.cmd.colorscheme("kauz");
        '';
      }

      else
        { }; # should never happen

  }) enabled);
}


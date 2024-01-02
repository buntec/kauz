{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.kauz;
  supported = [ "fish" "kitty" "neovim" "tmux" ];
  allEnabled = builtins.filter (s: cfg.${s}.enable) supported;
  capitalizeFirst = s:
    lib.toUpper (builtins.substring 0 1 s)
    + builtins.substring 1 (lib.stringLength s) s;

in {

  options.kauz = builtins.listToAttrs (builtins.map (s: {
    name = s.enable;
    value = mkEnableOption
      "Whether to enable the colorscheme for ${capitalizeFirst s}";
  }) supported);

  config = builtins.listToAttrs (builtins.map (enabled: {
    name = "programs.${enabled}";
    value =

      if enabled == "kitty" then {
        extraConfig = ''
          include ${pkgs.kauz-kitty}/kauz.conf
        '';
      }

      else if enabled == "tmux" then {
        extraConfig = ''
          builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";
        '';

      }

      else if enabled == "fish" then {
        plugins = [{
          name = "kauz-fish";
          inherit (pkgs.kauz-fish) src;
        }];

      }

      else if enabled == "neovim" then {
        plugins = [ pkgs.kauz-nvim ];
        extraLuaConfig = ''
          vim.cmd.colorscheme("kauz");
        '';
      }

      else
        { }; # should never happen

  }) allEnabled);
}


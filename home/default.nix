{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.colorschemes.kauz;
  tools = [ "kitty" "tmux" "fish" "neovim" ];
  isEnabled = tool: cfg.${tool}.enable;
  enabledTools = builtins.filter isEnabled tools;
  capitalizeFirst = s:
    lib.toUpper (builtins.substring 0 1 s)
    + builtins.substring 1 (lib.stringLength s) s;

in {

  options.colorschemes.kauz = builtins.listToAttrs (builtins.map (tool: {
    name = tool.enable;
    value = mkEnableOption "${capitalizeFirst tool} Kauz integration";
  }) tools);

  config = builins.listToAttrs (builtins.map (enabled: {
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

  }) enabledTools);
}


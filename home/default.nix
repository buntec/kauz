{ lib, pkgs, config, ... }:
with lib;

let

  cfg = config.colorschemes.kauz;

in {

  options.colorschemes.kauz = {
    enable = mkEnableOption "a colorscheme for neovim, kitty, fish and tmux";
  };

  config = mkIf cfg.enable {

    programs.kitty.extraConfig = ''
      include ${pkgs.kauz-kitty}/kauz.conf
    '';

    programs.tmux.extraConfig = builtins.readFile "${pkgs.kauz-tmux}/kauz.tmux";

    programs.fish.plugins = [{
      name = "kauz-fish";
      inherit (pkgs.kauz-fish) src;
    }];

    programs.neovim.plugins = [ pkgs.kauz-nvim ];

    programs.neovim.extraLuaConfig = ''
      vim.cmd.colorscheme("kauz")
    '';

  };

}

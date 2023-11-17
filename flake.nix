{
  description = "The Kauz colorscheme";

  outputs = { self, nixpkgs }:

    let
      inherit (nixpkgs) lib;
      inherit (nixpkgs.lib) genAttrs;

      version = if (self ? rev) then self.rev else "dirty";

      eachSystem = genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      mkPackages = pkgs: {
        kauz-nvim = (pkgs.vimUtils.buildVimPlugin {
          inherit version;
          pname = "kauz-nvim";
          src = ./.;
          meta.homepage = "https://github.com/buntec/kauz/";
        }).overrideAttrs { dependencies = [ pkgs.vimPlugins.lush-nvim ]; };

        kauz-fish = pkgs.fishPlugins.buildFishPlugin {
          inherit version;
          pname = "kauz-fish";
          src = ./extras/fish;
        };

      };

    in {

      packages = eachSystem (system:
        let pkgs = import nixpkgs { inherit system; };
        in mkPackages pkgs);

      overlays.default = final: _: mkPackages final;

    };
}

format:
	nix fmt

check:
	nix flake check

gen-extra:
	nvim -u NONE -E -R --headless --cmd "set rtp^=." --cmd "packloadall" --cmd "lua require('lush_theme.extra').setup(false)" --cmd qa
	nvim -u NONE -E -R --headless --cmd "set rtp^=." --cmd "packloadall" --cmd "lua require('lush_theme.extra').setup(true)" --cmd qa

clean:
	git clean -xdf

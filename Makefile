format:
	nix fmt

check:
	nix flake check

gen-extra:
	nvim -u NONE -E -R --headless --cmd "set rtp^=." --cmd "packloadall" --cmd "lua require('lush_theme.extra').setup()" --cmd qa

clean:
	git clean -xdf

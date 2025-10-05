gen-yaml:
    nvim --headless lua/kauz-gen.lua -c 'luafile %' +KauzWriteSchemeToYaml +q

gen-extra:
    python extra/gen.py

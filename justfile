gen-yaml:
    nvim --headless lua/kauz-gen.lua -c 'luafile %' +KauzWriteSchemeToYaml +q

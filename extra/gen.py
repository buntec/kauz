import yaml

WINDOWS_TERMINAL = """{{
  "name": "{name}",
  "foreground": "{base05}",
  "background": "{base00}",
  "cursorColor": "{base05}",
  "selectionBackground": "{base02}",
  "black": "{base00}",
  "red": "{base08}",
  "green": "{base0B}",
  "yellow": "{base0A}",
  "blue": "{base0D}",
  "purple": "{base0E}",
  "cyan": "{base0C}",
  "white": "{base05}",
  "brightBlack": "{base03}",
  "brightRed": "{base09}",
  "brightGreen": "{base01}",
  "brightYellow": "{base02}",
  "brightBlue": "{base04}",
  "brightPurple": "{base06}",
  "brightCyan": "{base0F}",
  "brightWhite": "{base07}"
}}"""


WINDOWS_TERMINAL_256 = """{{
  "name": "{name}",
  "foreground": "{base05}",
  "background": "{base00}",
  "cursorColor": "{base05}",
  "selectionBackground": "{base02}",
  "black": "{base00}",
  "red": "{base08}",
  "green": "{base0B}",
  "yellow": "{base0A}",
  "blue": "{base0D}",
  "purple": "{base0E}",
  "cyan": "{base0C}",
  "white": "{base05}",
  "brightBlack": "{base03}",
  "brightRed": "{base08}",
  "brightGreen": "{base0B}",
  "brightYellow": "{base0A}",
  "brightBlue": "{base0D}",
  "brightPurple": "{base0E}",
  "brightCyan": "{base0C}",
  "brightWhite": "{base07}"
}}"""


if __name__ == "__main__":
    for variant in ["light", "dark"]:
        with open(f"base24/kauz-{variant}.yml") as f:
            data = yaml.safe_load(f)
            scheme = WINDOWS_TERMINAL.format(name=f"Kauz {variant}", **data["palette"])
            with open(f"extra/kauz-windows-terminal-{variant}.json", "w") as g:
                g.write(scheme)
            scheme_256 = WINDOWS_TERMINAL_256.format(
                name=f"Kauz {variant} (256)", **data["palette"]
            )
            with open(f"extra/kauz-windows-terminal-{variant}-256.json", "w") as g:
                g.write(scheme_256)
    print("done!")

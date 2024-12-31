local M = {}

local function write(str, fileName)
  print("[write] extra/" .. fileName)
  vim.fn.mkdir(vim.fs.dirname("extras/" .. fileName), "p")
  local file = io.open("extras/" .. fileName, "w")
  file:write(str)
  file:close()
end

function M.write_file(file, contents)
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

function M.setup(light)
  local kauz
  if light then
    kauz = require "lush_theme.kauz_light"
  else
    kauz = require "lush_theme.kauz"
  end

  local kitty = require "lush_theme.extra.kitty"
  local fish = require "lush_theme.extra.fish"
  local tmux = require "lush_theme.extra.tmux"
  local meta = require "lush_theme.extra.meta"

  local fname = "kitty/kauz.conf"
  if light then
    fname = "kitty/kauz-light.conf"
  end

  write(
    kitty.generate {
      foreground = kauz.Normal.fg.hex,
      background = kauz.Normal.bg.hex,
      selection_foreground = kauz.Normal.fg.hex,
      selection_background = kauz.Visual.bg.hex,
      cursor = kauz.Cursor.bg.hex,
      cursor_text_color = kauz.Cursor.fg.hex,
      black = kauz.KittyBlack.fg.hex,
      black_bright = kauz.KittyBlackBright.fg.hex,
      red = kauz.KittyRed.fg.hex,
      red_bright = kauz.KittyRedBright.fg.hex,
      green = kauz.KittyGreen.fg.hex,
      green_bright = kauz.KittyGreenBright.fg.hex,
      yellow = kauz.KittyYellow.fg.hex,
      yellow_bright = kauz.KittyYellowBright.fg.hex,
      blue = kauz.KittyBlue.fg.hex,
      blue_bright = kauz.KittyBlueBright.fg.hex,
      magenta = kauz.KittyMagenta.fg.hex,
      magenta_bright = kauz.KittyMagentaBright.fg.hex,
      cyan = kauz.KittyCyan.fg.hex,
      cyan_bright = kauz.KittyCyanBright.fg.hex,
      white = kauz.KittyWhite.fg.hex,
      white_bright = kauz.KittyWhiteBright.fg.hex,
      active_border_color = kauz.KittyBorderActive.fg.hex,
      inactive_border_color = kauz.KittyBorderInactive.fg.hex,
      url_color = kauz.KittyUrl.fg.hex,
    },
    fname
  )

  fname = "fish/kauz/conf.d/kauz.fish"
  if light then
    fname = "fish/kauz-light/conf.d/kauz-light.fish"
  end

  write(
    fish.generate {
      normal = kauz.FishNormal.fg.hex,
      command = kauz.FishCommand.fg.hex,
      keyword = kauz.FishKeyword.fg.hex,
      quote = kauz.FishQuote.fg.hex,
      redirection = kauz.FishRedirection.fg.hex,
      ["end"] = kauz.FishEnd.fg.hex,
      error = kauz.FishError.fg.hex,
      param = kauz.FishParam.fg.hex,
      comment = kauz.FishComment.fg.hex,
      selection = kauz.FishSelection.fg.hex,
      operator = kauz.FishOperator.fg.hex,
      escape = kauz.FishEscape.fg.hex,
      autosuggestion = kauz.FishAutosuggestion.fg.hex,
      pager_progress = kauz.FishPagerProgress.fg.hex,
      pager_prefix = kauz.FishPagerPrefix.fg.hex,
      pager_completion = kauz.FishPagerCompletion.fg.hex,
      pager_description = kauz.FishPagerDescription.fg.hex,
      pager_selected_background = kauz.FishPagerSelectedBackground.fg.hex,
      pure_prompt = kauz.FishPurePrompt.fg.hex,
      pure_danger = kauz.FishPureDanger.fg.hex,
      pure_dark = kauz.FishPureDark.fg.hex,
      pure_info = kauz.FishPureInfo.fg.hex,
      pure_light = kauz.FishPureLight.fg.hex,
      pure_mute = kauz.FishPureMute.fg.hex,
      pure_normal = kauz.FishPureNormal.fg.hex,
      pure_primary = kauz.FishPurePrimary.fg.hex,
      pure_success = kauz.FishPureSuccess.fg.hex,
      pure_warning = kauz.FishPureWarning.fg.hex,
    },
    fname
  )

  fname = "tmux/kauz.tmux"
  if light then
    fname = "tmux/kauz-light.tmux"
  end

  write(
    tmux.generate {
      mode_fg = kauz.TmuxMode.fg.hex,
      mode_bg = kauz.TmuxMode.bg.hex,
      message_fg = kauz.TmuxMessage.fg.hex,
      message_bg = kauz.TmuxMessage.bg.hex,
      message_command_fg = kauz.TmuxMessageCommand.fg.hex,
      message_command_bg = kauz.TmuxMessageCommand.bg.hex,
      pane_border_fg = kauz.TmuxPaneBorder.fg.hex,
      pane_active_border_fg = kauz.TmuxPaneActiveBorder.fg.hex,
      status_fg = kauz.TmuxStatus.fg.hex,
      status_bg = kauz.TmuxStatus.bg.hex,
      status_left_fg = kauz.TmuxStatusLeft.fg.hex,
      status_left_bg = kauz.TmuxStatusLeft.bg.hex,
      status_right_fg = kauz.TmuxStatusRight.fg.hex,
      status_right_bg = kauz.TmuxStatusRight.bg.hex,
      window_status_fg = kauz.TmuxWindowStatus.fg.hex,
      window_status_bg = kauz.TmuxWindowStatus.bg.hex,
      window_status_activity_fg = kauz.TmuxWindowStatusActivity.fg.hex,
      window_status_activity_bg = kauz.TmuxWindowStatusActivity.bg.hex,
    },
    fname
  )

  fname = "meta/meta.txt"
  if light then
    fname = "meta/meta-light.txt"
  end

  write(
    meta.generate {
      c1 = kauz.KauzMetaC1.fg.hex,
      c2 = kauz.KauzMetaC2.fg.hex,
      c3 = kauz.KauzMetaC3.fg.hex,
      c4 = kauz.KauzMetaC4.fg.hex,
      c5 = kauz.KauzMetaC5.fg.hex,
      fg = kauz.KauzMetaFg.fg.hex,
      bg = kauz.KauzMetaBg.fg.hex,
      comment = kauz.KauzMetaComment.fg.hex,
    },
    fname
  )
end

return M

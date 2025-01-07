{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "transmission"
    "android-studio"
    "obsidian"
    "notion"
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Google Chrome.app"
    "/Applications/Obsidian.app"
    "/Applications/WezTerm.app"
    "/Applications/Zed.app"
    "/Applications/Telegram.app"
    "/Applications/Slack.app"
    "/Applications/Notion.app"
  ];
}

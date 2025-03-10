{ ... }:
{

  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = false;
    magnification = false;

    # hot corners
    wvous-tr-corner = 1; # disabled
    wvous-br-corner = 1; # disabled
    wvous-bl-corner = 1; # disabled
    wvous-tl-corner = 1; # disabled
  };

  # Increase key repeat rate. It helps with typing faster.
  system.defaults.NSGlobalDomain = {
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    ApplePressAndHoldEnabled = false;
  };

  # Disable long animation for tails switching.
  system.defaults.universalaccess.reduceMotion = true;
  system.defaults.universalaccess.reduceTransparency = true;

  # Enable sudo via TouchID or Apple Watch.
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };
}

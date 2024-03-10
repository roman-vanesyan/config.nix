# This file is an entry point for the home-manager for a specified user.

{ lib, pkgs, ... }: {
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    nixpkgs-review
    tree-sitter
    gleam # fancy programming language
    volta # nodejs manager

    obsidian
  ] ++ [
    pkgs.apple-sf-mono-font
    # pkgs.dockutil
  ];

  # Load environment variables from $(cwd)/.env
  # see https://direnv.net/
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      gc = "git commit";
      ga = "git add";
      gf = "git pull";
      gp = "git push";
      gs = "git status";

      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";

      htop = "btop";
      top = "btop";

      # TODO: make configurable 
      switch = "nix run nix-darwin -- switch --flake .#macbook-pro-i7";
    };

    history = {
      size = 3000;
      save = 3000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" ];
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.navi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.awscli.enable = true;
  programs.git = {
    enable = true;
    userName = "Roman Vanesyan";
    userEmail = "roman@vanesyan.com";

    aliases = {
      co = "checkout";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        untrackedCache = true;
        whitespace = "space-before-tab,trailing-space";
        autocrlf = "input";
      };

      color.ui = "auto";
      diff.renames = "copies";
      help.autoCorrect = "1";
      log.merge = true;
      push = {
        default = "simple";
        autoSetupRemote = true;
        gpgSign = "if-asked";
      };

      url."git@github.com:" = {
        insteadOf = "https://github.com/";
        pushInsteadOf = "git://github.com/";
      };

      url."git@gist.github.com:" = {
        insteadOf = "https://gist.github.com/";
        pushInsteadOf = "git://gist.github.com/";
      };
    };
  };

  programs.ssh = {
    enable = true;
    # I use 1password for storing my SSH key. 1password is installed via
    # homebrew.
    extraConfig = ''
      Host *
        IdentityAgent "/Users/roman/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };

  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go_1_22;
  };

  home.sessionVariables = {
    VOLTA_HOME = "/Users/roman/.volta";
  };

  home.sessionPath = [
    "$HOME/.volta/bin"
    "$HOME/go/bin"
  ];
}

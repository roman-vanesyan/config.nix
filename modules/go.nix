{ pkgs, ... }:
{
  home.packages = with pkgs; [
    golangci-lint
    golines # lines format
    gofumpt # alternative formatter
  ];

  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}

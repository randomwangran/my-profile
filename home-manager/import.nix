{ pkgs, config, substituteAll,... }:
{
  nixpkgs.config.allowUnfree = true;
  
  home.packages = let
    nixpkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
    nixpkgs-master = import (fetchGit { url = https://github.com/nixos/nixpkgs; ref = "master"; }) { config = { allowUnfree = true; }; };

  in with pkgs; [
    aria2
    xclip
    urxvt_perls
    ag
    graphviz
    rofi
    fd
    ripgrep
    feh
    outline-client
    compton
    youtube-dl
    shadowsocks-qt5
  ];

  
  imports = [
    ./org-emacs.nix
    ./git.nix
    ./cursor.nix
    ./randr/work.nix
    ./fish.nix
    #lang
    lang/lsp.nix
    #programs
  ];

}

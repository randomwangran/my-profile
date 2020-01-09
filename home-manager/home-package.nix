let
  nixpkgs = (import ~/.config/nixpkgs/nixos/channel/nixpkgs) { };
  remacs = (import ./programs/remacs-nix/build.nix) {};
  unstable = import <nixpkgs-unstable> { };

  
  ownpkgs_git = builtins.fetchTarball {
    url    = "https://github.com/GTrunSec/nixpkgs-channels/tarball/60e1709baefb8498103d598ca4f14ac39719d448";
    sha256 = "15vsi0k65vjmr57jdjihad1yx0d8i83xnc0v7fpymgrwldvjblx4";
  };

  ownpkgs = (import ownpkgs_git) { };
 
in   {
  home.packages = with nixpkgs;[
    #remacs
    aria2
    xclip
    screenfetch
    urxvt_perls
    ag
    hunspell
    #dnsproxy
    graphviz
    rofi
    pkgs.pandoc
    fd
    ripgrep
    feh
    lsof
    lm_sensors
    #image
    gimp
    #brower
    # (brave.overrideDerivation (oldAttrs: {
    #   version = "1.3.4";
    #   src = fetchurl {
    #     url = "https://github.com/brave/brave-browser/releases/download/v1.3.4/brave-browser-nightly_1.3.4_amd64.deb";
    #     sha256 = "093m2p046v89sisy5gs08qnqx8jf6d488a5ws8vcyg5h6hyfdcqr";
    #   };
    # }))
    brave
    #chat
    (signal-desktop.overrideDerivation (oldAttrs: {
      version = "1.29.0";
      src = fetchurl {
        url = "https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_1.29.0_amd64.deb";
        sha256 = "1zbj0z4bhmg6zf975bn67wpr1kdi0h05d90aniijnh5wqgnwhfqn";
      };
    }))
    #gitter
    #music
    cmus
    compton
    discord
    #skim
    screenfetch
    (polar-bookshelf.overrideDerivation (oldAttrs: {
      src = fetchurl {
        url = "https://github.com/burtonator/polar-bookshelf/releases/download/v1.80.10/polar-bookshelf-1.80.10-amd64.deb";
        sha256 = "1gbk2igk8k9kndvg2rrgfycrw4pdfiwi9fhpai6gh12dxj598l2w";
      };
    }))
    #overlay
    outline-client
    youtube-dl
    shadowsocks-qt5
    sshfs
    ms-pyls
    #nur
    imgcat

    #haskell
    haskellPackages.hlint
    haskellPackages.hoogle
    cabal-install
    #(haskell.lib.dontCheck haskellPackages.intero)
    haskellPackages.alex
    haskellPackages.happy
    haskellPackages.zlib
    haskellPackages.stack

    haskellPackages.stylish-haskell
    #multi-ghc-travis
    niv
    #downloader
    motrix
    #adguardhome
    #log database
    vast
    
    #emacs elf
    lxqt.qtermwidget
    deepsea
    vgo2nix

    ##https://github.com/NixOS/nixpkgs/issues/77304 reset to stable rev. cause of pandas test failed.
    (ownpkgs.python3.withPackages (ownpkgs: with ownpkgs; [
      # rl algorithms
      dbus
      qrcode
      pyqt5
      pymupdf
      xlib
      grip
      pyqtwebengine
      pytest
      numpy
      orgparse
      jupyter_core
      ipynb-py-convert
      scikitlearn
      zat
      matplotlib
      sqlalchemy
      pandas
      ipython
      pygments
      notebook
      orgbabelhelper
      ipykernel
    ]))

    #Go
    horcrux
    #zeek
    rocksdb
    sqlite
    fish-foreign-env
    pkgs.fzf
    # Bash
    # unstable.nodePackages.bash-language-server
    # nodePackages.javascript-typescript-langserver
    # Nix
    ghc
    autojump
    #    hnix-lsp
    jq
    #dock
    dive

    #desktop
    #Go-lang
    dep
    gosec
    gotty
    #blueman
    blueman
    nodejs
    
  ];
}

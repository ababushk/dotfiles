software needed:
- xscreensaver for screen lock
- awesome WM 4.3 (https://launchpad.net/~klaus-vormweg/+archive/ubuntu/awesome for Ubuntu 18, Fedora and Arch already have it) and lua-posix package
  - For Ubuntu 18 lua-posix package from repo need additional tuning (due to https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=891541):
    ```
    cd /usr/lib/x86_64-linux-gnu/lua/5.3/
    ln -s posix_c.so posix.so
    ```
- scrot - taking screenshots
- alacritty - terminal emulator
  - Install on Ubuntu 18
    ```
    sudo -E add-apt-repository ppa:mmstick76/alacritty
    sudo apt update
    sudo apt install alacritty
    ```
- xclip - clipboard manipulation
- qt5ct - Qt applications theme configuration
software added to autostart:
- xscreensaver daemon
- akonadi daemon to enable exchange e-mail in kmail and kontact

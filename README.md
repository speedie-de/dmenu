# dmenu
speedie's dmenu configuration

This is my personal always-changing build of [suckless.org](https://suckless.org)'s [dmenu](https://tools.suckless.org/dmenu).
It has alpha, case-insensitive, grid, xresources, color font/emoji, highlight and pywal support built right in and integrates well with my build of [dwm](https://github.com/speedie-de/dwm).

### Installation
- Install dev-vcs/git using your favorite package manager
- git clone <this-url>
- cd dmenu
- sudo make install
- Follow "Installing libXft-bgra"

### Installing libXft-bgra
Thankfully, I made this process a bit easier by building it into the Makefile.

- cd dmenu
- make libxftfix # For all distros except Gentoo
- make gentoo-libxftfix # For Gentoo
- make arch-libxftfix # For Arch

### Important
- This build does not keep object files or config.h. Those are automatically deleted after a successful compile. If a compile is not successful, they will not be deleted. If that's the case, do NOT edit config.h because if you do and it compiles successfully then your changes will be lost.
- This build REQUIRES libXft-bgra. If you don't know what that is, it's a patched build of libXft which fixes a bug which causes dmenu to crash when displaying certain characters.

### Features
This build of dmenu has full compatibility with .Xresources and allows defining these options:
- dmenu.font
- dmenu.background
- dmenu.foreground
- dmenu.selbackground
- dmenu.selforeground

If you are unsure, you can look at the example.Xresources file that should be included.

### Scripts
This build of dmenu should work with all dmenu scripts. Here are a few I've written/use:
- [copyout](https://github.com/speediegamer/copyout)
- [emojilist](https://raw.githubusercontent.com/speedie-de/st/main/emojilist)
- [dboard](https://github.com/speediegamer/dboard)
- [dsearch](https://github.com/speediegamer/dsearch)
- [dfmpeg](https://github.com/speediegamer/dfmpeg)
- [cfgedit](https://github.com/speediegamer/cfgedit)
- [swal](https://github.com/speediegamer/swal)
- [More Scripts](https://speedie.gq/dmenu-scripts.html)

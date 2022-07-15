# dmenu

# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c stest.c util.c
OBJ = $(SRC:.c=.o)

all: options dmenu stest

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

dmenu: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS) && rm -f config.h stest.o util.o drw.o dmenu.o

stest: stest.o
	$(CC) -o $@ stest.o $(LDFLAGS)

clean:
	rm -f dmenu stest $(OBJ) dmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p dmenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk dmenu.1\
		drw.h util.h dmenu_path dmenu_run stest.1 $(SRC)\
		dmenu-$(VERSION)
	tar -cf dmenu-$(VERSION).tar dmenu-$(VERSION)
	gzip dmenu-$(VERSION).tar
	rm -rf dmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dmenu dmenu_path dmenu_run stest $(DESTDIR)$(PREFIX)/bin 
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/stest
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < dmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	sed "s/VERSION/$(VERSION)/g" < stest.1 > $(DESTDIR)$(MANPREFIX)/man1/stest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/stest.1
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dmenu_path\
		  $(DESTDIR)$(PREFIX)/bin/dmenu_run\
		  $(DESTDIR)$(PREFIX)/bin/dmenu\
		  $(DESTDIR)$(PREFIX)/bin/stest\
		  $(DESTDIR)$(MANPREFIX)/man1/dmenu.1\
		  $(DESTDIR)$(MANPREFIX)/man1/stest.1


libxftfix:
	git clone https://github.com/uditkarode/libxft-bgra && cd libxft-bgra
	sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
	make install
	cd .. && rm -r libxft-bgra

gentoo-libxftfix:
	mkdir -pv /etc/portage/patches/x11-libs/libXft
	curl -o /etc/portage/patches/x11-libs/libXft/bgra.diff https://gitlab.freedesktop.org/xorg/lib/libxft/-/merge_requests/1.patch
	emerge x11-libs/libXft

arch-libxftfix:
	git clone https://aur.archlinux.org/libxft-bgra
	cd libxft-bgra
	makepkg -i

help:
	@echo install: Installs dmenu. You may need to run this as root.
	@echo uninstall: Uninstalls dmenu. You may need to run this as root.
	@echo libxftfix: This option compiles and installs libXft-bgra which is necessary to prevent dmenu from crashing.
	@echo gentoo-libxftfix: This option installs libXft-bgra by patching it for Gentoo only.
	@echo arch-libxftfix: This option installs libXft-bgra using the AUR on Arch Linux only.
	@echo help: Displays this help sheet.

.PHONY: all options clean dist install uninstall libxftfix gentoo-libxftfix arch-libxftfix help

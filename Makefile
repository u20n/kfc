CFLAGS 		+= -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
PREFIX		?= /usr
BINDIR		?= $(PREFIX)/bin
MANPREFIX ?= $(PREFIX)/man
CC     		?= gcc

all: kfc

kfc: kfc.c Makefile
	$(CC) -O3 $(CFLAGS) -o $@ $< $(LDFLAGS)

install: all
	install -Dm755 kfc $(DESTDIR)$(BINDIR)/kfc
	install -Dm644 kfc.1 $(DESTDIR)$(MANPREFIX)/man1/kfc.1
	mkdir -p $(DESTDIR)/usr/share/kfc
	cp -r palettes $(DESTDIR)/usr/share/kfc

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/kfc
	rm -rf $(DESTDIR)/usr/share/kfc
	rm -rf $(DESTDIR)$(MANPREFIX)/man1/kfc.1

clean:
	rm -f kfc *.o

.PHONY: all install uninstall clean

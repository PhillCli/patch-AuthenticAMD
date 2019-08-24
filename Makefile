CFLAGS = -std=c99 -Wall -pedantic
LDFLAGS = -s -lelf
PREFIX = /usr/local

all: patch-AuthenticAMD

patch-AuthenticAMD: patch-AuthenticAMD.c
	gcc ${CFLAGS} patch-AuthenticAMD.c -o patch-AuthenticAMD ${LDFLAGS}

install: all
	install -D -m 755 -o root -g root patch-AuthenticAMD ${DESTDIR}${PREFIX}/bin/patch-AuthenticAMD

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/patch-AuthenticAMD

clean:
	rm -f patch-AuthenticAMD *.o tags

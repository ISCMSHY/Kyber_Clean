CC=/usr/bin/gcc
# CFLAGS += -O3 -fomit-frame-pointer -Wall -Wextra -Wpedantic -Werror -Wmissing-prototypes -Wredundant-decls -std=c99 -I./common $(EXTRAFLAGS)
CFLAGS += -O3 -fomit-frame-pointer -Wall -Wextra -Wpedantic -Werror -Wmissing-prototypes -Wredundant-decls -std=c99 -I./common $(EXTRAFLAGS)
LDFLAGS=-lcrypto

KYBER_SOURCES= cbd.c indcpa.c kem.c ntt.c poly.c polyvec.c reduce.c symmetric-shake.c verify.c ./common/fips202.c ./common/randombytes.c
KYBER_HEADERS= api.h cbd.h indcpa.h kem.h ntt.h params.h poly.h polyvec.h reduce.h symmetric.h verify.h ./common/fips202.h ./common/randombytes.h

all : make build

make : main.c $(KYBER_SOURCES) $(KYBER_HEADERS)
	$(CC) $(CFLAGS) main.c $(KYBER_SOURCES) -o main $(LDFLAGS)

build : ./main

clean : rm -f main
include ../makefile.inc

CFLAGS = -Werror -Wall -std=gnu90
CFLAGS += -iquote ../

all: mkfs

mkfs: mkfs.c
	$(HOSTCC) $(CFLAGS) -o $@ $^

clean:
	rm -f mkfs	

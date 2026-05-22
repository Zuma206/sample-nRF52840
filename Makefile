prefix := arm-none-eabi
cc := $(prefix)-gcc

outfile = main.elf
cflags = -nolibc -nostdlib
sources = $(wildcard src/*.c)

$(outfile): $(sources)
	$(cc) $(cflags) $(sources) -o $@

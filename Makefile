# Makefile from github.com/zuma206/sample-nRF52840

# Specific gcc platform specific version
prefix := arm-none-eabi
cc := $(prefix)-gcc
# The output file to create
outfile = main.elf

# Enable stricter compiler warnings
warnings = -Wall -Wextra
# Remove standard library and glibc
libraries = -nolibc -nostdlib
# nRF52840 specific CPU information
machine = -mcpu=cortex-m4 -mthumb -T nRF52840.ld
# Full set of c-compiler flags
cflags = $(libraries) $(warnings) $(machine)
# Get a list of all c source files
sources = $(wildcard src/*.c)

$(outfile): $(sources)
	$(cc) $(cflags) $(sources) -o $@

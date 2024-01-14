GCCPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
NASMPARAMS = --32
LDPARAMS = -melf_i386

BUILD_DIR = build

all: kernel.bin

%.o: %.s
	nasm -f elf32 boot.s

%.o: %.c
	gcc -m32 -c kernel.c -o kernel.o

OBJ_FILES = kernel.o boot.o

kernel.bin: linker.ld $(OBJ_FILES)

	@echo "Building Linux from scratch"
	@echo ""

	ld $(LDPARAMS) -T $< -o kernel.bin $(OBJ_FILES)

#
#nasm -f elf32 boot.s -o boot.o
#gcc -m32 -c kernel.c -o kernel.o
#ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o

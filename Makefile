GCCPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
NASMPARAMS = -f elf32
LDPARAMS = -m elf_i386
SRC_DIR = src
OBJ_FILES = kernel.o boot.o

all: kernel.bin

boot.o: boot.s
	nasm $(NASMPARAMS) boot.s -o boot.o

kernel.o: kernel.c
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o

kernel.bin: linker.ld $(OBJ_FILES)

	@echo "[+] Building LinuxFromScratch"
	@echo "[+] ..."
	@echo " "
	ld $(LDPARAMS) -T linker.ld -o kernel.bin $(OBJ_FILES)
	@echo "[+] Succesfully builded."

#
#nasm -f elf32 boot.s -o boot.o
#gcc -m32 -ffreestanding -c kernel.c -o kernel.o
#ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
#grub-mkrescue -o LinuxFromScratch.iso LinuxFromScratch/*
#qemu-system-i386 -cdrom LinuxFromScratch.iso

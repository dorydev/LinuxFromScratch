# Linux from scratch #

A simple Linux based kernel written in C & x86_64 assembly.\
It'll be upgraded soon, check versions & update ;)

## How to compile ? ##

Prerequisite:\
- grub
- nasm
- gcc
- xorriso
- qemu


Compile assembly & C files in object files with nasm & gcc:\ 

```nasm -f elf32 boot.s -o boot.o```\
```gcc -m32 -ffreestanding -c kernel.c -o kernel.o```\

Link objectfs files:\

```ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o```\

Create iso file with grub:\

```grub-mkrescue -o LinuxFromScratch.iso LinuxFromScratch/*```\

Launch in QEMU:\

Open the project forlder in your terminal and type\

```$ cd LinuxFromScratch``` //PATH of .iso's folder\
```qemu-system-i386 -cdrom LinuxFromScratch.iso```\

GG it works !



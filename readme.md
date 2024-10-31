## Linux from scratch ##

A simple Linux based kernel written in C & x86_64 assembly.
It'll be upgraded soon, check versions & update ;)

# How to compile ? #

```nasm -f elf32 boot.s -o boot.o```
```gcc -m32 -ffreestanding -c kernel.c -o kernel.o```
```ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o```
```grub-mkrescue -o LinuxFromScratch.iso LinuxFromScratch/*```
```qemu-system-i386 -cdrom LinuxFromScratch.iso```

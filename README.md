# 🐧 Linux From Scratch

A simple Linux-based kernel written in C and x86_64 assembly.

## 📋 Table of Contents

- [📖 Project Overview](#project-overview)
- [🔧 Prerequisites](#prerequisites)
- [⚙️ How to Compile](#how-to-compile)
  - [📝 Compile Assembly and C Files](#compile-assembly-and-c-files)
  - [🔗 Link Object Files](#link-object-files)
  - [💿 Create ISO File with GRUB](#create-iso-file-with-grub)
  - [🚀 Launch in QEMU](#launch-in-qemu)
- [💡 Usage](#usage)

## 📖 Project Overview

This project aims to create a minimal Linux-based operating system from scratch. It involves writing a kernel in C and assembly, setting up a bootloader, and creating an ISO image that can be run in a virtual machine.

## 🔧 Prerequisites

Ensure you have the following tools installed:
- grub
- nasm
- gcc
- xorriso
- qemu

Alternatively, you can use the `build.sh` script to install the dependencies:

```sh
./build.sh
```

## ⚙️ How to Compile

### 📝 Compile Assembly and C Files

Compile the assembly and C files into object files using nasm and gcc:

```sh
nasm -f elf32 boot.s -o boot.o
gcc -m32 -ffreestanding -nostdlib -c kernel.c -o kernel.o
```

### 🔗 Link Object Files

Link the object files to create the kernel binary:

```sh
ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
```

### 💿 Create ISO File with GRUB

Create an ISO file using grub:

```sh
grub-mkrescue -o LinuxFromScratch.iso LinuxFromScratch/*
```

### 🚀 Launch in QEMU

Open the project folder in your terminal and type:

```sh
cd LinuxFromScratch
qemu-system-i386 -cdrom LinuxFromScratch.iso
```

Alternatively, you can use the Makefile for compilation:

- To build the kernel binary:

```sh
make
```

- To create a bootable ISO image:

```sh
make iso
```

- To clean up the build files:

```sh
make clean
```

- To rebuild the project:

```sh
make re
```

- To run the kernel directly:

```sh
make run
```

- To run the kernel with GRUB:

```sh
make rungrub
```

## 💡 Usage

Once the ISO is created and launched in QEMU, the kernel will display "HELLO WORLD" on the screen. This demonstrates the basic functionality of the kernel and its ability to interact with the VGA buffer.

**Congratulations, it works!**
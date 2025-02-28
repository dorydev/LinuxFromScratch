GCCPARAMS = -m32 -fno-use-cxa-atexit -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
NASMPARAMS = -f elf32
LDPARAMS = -m elf_i386
SRC_DIR = src
OBJ_FILES = kernel.o boot.o

all: kernel.bin

boot.o: boot.s
	nasm $(NASMPARAMS) boot.s -o boot.o

kernel.o: kernel.c
	@echo "[+] Compiling kernel.c"
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o

kernel.bin: linker.ld $(OBJ_FILES)
	@echo "[+] Building LinuxFromScratch"
	@echo "[+] ..."
	@echo " "
	ld $(LDPARAMS) -T linker.ld -o kernel.bin $(OBJ_FILES)
	@echo "[+] Succesfully builded."

iso: kernel.bin
	@echo "[+] Creating ISO image"
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/
	echo 'set timeout=0' > iso/boot/grub/grub.cfg
	echo 'set default=0' >> iso/boot/grub/grub.cfg
	echo 'menuentry "LinuxFromScratch" {' >> iso/boot/grub/grub.cfg
	echo '  multiboot /boot/kernel.bin' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue -o dorykernel.iso iso
	rm -rf iso
	mv dorykernel.iso LinuxFromScratch
	@echo "[+] ISO image created"

clean:
	@echo "[+] Cleaning up"
	rm -f *.o kernel.bin
	rm -f LinuxFromScratch/*.iso
	@echo "[+] Done."

run: kernel.bin
	@echo "[+] Running LinuxFromScratch"
	qemu-system-i386 -kernel kernel.bin
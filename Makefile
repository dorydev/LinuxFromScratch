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
	echo 'set timeout=10' > iso/boot/grub/grub.cfg
	echo 'set default=0' >> iso/boot/grub/grub.cfg
	echo 'menuentry "1 - Demarrer LinuxFromScratch" {' >> iso/boot/grub/grub.cfg
	echo '  multiboot /boot/kernel.bin' >> iso/boot/grub/grub.cfg
	echo '  boot' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	echo 'menuentry "2 - Redemarrer" {' >> iso/boot/grub/grub.cfg
	echo '  reboot' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	echo 'menuentry "3 - Arreter" {' >> iso/boot/grub/grub.cfg
	echo '  halt' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue -o LinuxFromScratch.iso iso
	rm -rf iso
	mkdir -p LinuxFromScratch
	mv LinuxFromScratch.iso LinuxFromScratch/LinuxFromScratch.iso
	@echo "[+] ISO image created"

clean:
	@echo "[+] Cleaning up"
	rm -f *.o kernel.bin
	rm -f LinuxFromScratch/*.iso
	@echo "[+] Done."

re: clean all

run: kernel.bin
	@echo "[+] Running LinuxFromScratch"
	qemu-system-i386 -kernel kernel.bin

rungrub:
	@echo "[+] Running LinuxFromScratch with grub"
	qemu-system-i386 -cdrom LinuxFromScratch/LinuxFromScratch.iso -boot d
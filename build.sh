#!/bin/bash
# filepath: /home/guilh/Documents/Programming/C/LinuxFromScratch/build.sh

# Define colors for better output lol
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=== Linux From Scratch Development Environment Setup ===${NC}"
echo -e "${YELLOW}Detecting operating system...${NC}"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo -e "${RED}Cannot detect operating system. Exiting.${NC}"
    exit 1
fi

echo -e "${GREEN}Detected $OS distribution${NC}"

command_exists() {
    command -v "$1" &> /dev/null
}

install_packages() {
    echo -e "${YELLOW}Installing required dependencies...${NC}"

    case $OS in
        ubuntu|debian)
            sudo apt-get update
            sudo apt-get install -y gcc xorriso grub-common grub2-common grub-pc \
                                   nasm qemu-system-x86 build-essential grub-pc-bin
            ;;
        fedora)
            sudo dnf update
            sudo dnf install -y gcc xorriso grub2 grub2-tools \
                              nasm qemu-system-x86 make grub-pc-bin
            ;;
        arch|manjaro)
            sudo pacman -Syu
            sudo pacman -S --noconfirm gcc xorriso grub \
                                      nasm qemu make grub-pc-bin
            ;;
        *)
            echo -e "${RED}Unsupported operating system: $OS${NC}"
            echo -e "${YELLOW}Please install the following packages manually:${NC}"
            echo "  - gcc (C compiler)"
            echo "  - xorriso (ISO creator)"
            echo "  - grub (bootloader)"
            echo "  - nasm (assembler)"
            echo "  - qemu (emulator)"
            echo "  - make (build tool)"
            exit 1
            ;;
    esac

    echo -e "${GREEN}Dependencies installed successfully!${NC}"
}

echo -e "${YELLOW}Checking for required tools...${NC}"

MISSING_TOOLS=false

for tool in gcc nasm make xorriso qemu-system-i386; do
    if command_exists $tool; then
        echo -e "${GREEN}✓ $tool is installed${NC}"
    else
        echo -e "${RED}✗ $tool is not installed${NC}"
        MISSING_TOOLS=true
    fi
done

if [ "$MISSING_TOOLS" = true ]; then
    install_packages
else
    echo -e "${GREEN}All required tools are already installed!${NC}"
fi

echo -e "${BLUE}Setup complete! You can now build your kernel using 'make' command.${NC}"
echo -e "${YELLOW}Tip: Use 'make iso' to create a bootable ISO image.${NC}"
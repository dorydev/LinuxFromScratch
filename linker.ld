OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)
ENTRY(start)
SECTIONS
{
    . = 0x0100000; /*Kernel load adress*/

    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
}
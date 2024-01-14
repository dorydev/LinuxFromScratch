OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)
ENTRY(_start)
SECTIONS
{
    . = 0x0100000; /*Kernel load adress*/

    .text :
    {
        *(.text*)
    }

    .data :
    {
        *(.data)
    }

    .bss :
    {
        *(.bss)
    }
}
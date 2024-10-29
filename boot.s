section .multiboot
    align 4
    dd 0x1BADB002            ; Magic number pour Multiboot
    dd 0x0                   ; Flags
    dd -(0x1BADB002 + 0x0)   ; Checksum

section .text
bits 32
global _start
extern kernel_main

_start:
    cli                   ; Désactive les interruptions
    call kernel_main      ; Appelle la fonction principale du noyau
    hlt                   ; Arrête le processeur

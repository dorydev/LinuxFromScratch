section .multiboot
    align 4
    dd 0x1BADB002            
    dd 0x0                  
    dd -(0x1BADB002 + 0x0)   

section .text
bits 32
global _start
extern kernel_main

_start:
    cli                   
    call kernel_main      
    hlt                   

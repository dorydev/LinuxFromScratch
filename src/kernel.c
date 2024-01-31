//header files
#include "kernel.h"
#include "keyboard.h"

//somes values
uint32 vga_index;
static uint32 next_line_index = 1;

static foreground_color = COLOR_WHITE, background_color = COLOR_BLACK;

uint32 vga_entry(unsigned char ch, uint8 f_color, uint8 b_color)
{
    uint16 ax = 0;
    uint16 ah = 0, al = 0;

    ah = b_color;
    ah << 4;
    ah |= f_color;

    ax = ah;
    ax <<= 8;
    al = ch;
    ax |= al;

    return ax;
}

void clear_vga_buffers(void)
{

}

void init_vga(uint8 f_color, uint8 b_color)
{

}

void print_new_line()
{

}

void write_data()
{

}

//main function
void kernel_main(void)
{

    write_data("hello world!");
    /*char* vMem=(char*)0xb8000;
    vMem[0] = 'H';
    vMem[1] = 0x04;
    vMem[2] = 'E';
    vMem[3] = 0x04;
    vMem[4] = 'L';
    vMem[5] = 0x04;
    vMem[6] = 'L';
    vMem[7] = 0x04;
    vMem[8] = 'O';
    vMem[9] = 0x04;
    vMem[10] = 'W';
    vMem[11] = 0x04;
    vMem[12] = 'O';
    vMem[13] = 0x04;
    vMem[14] = 'R';
    vMem[15] = 0x04;
    vMem[16] = 'L';
    vMem[17] = 0x04;
    vMem[18] = 'D';
    vMem[19] = 0x04;*/

    //while(1);
}
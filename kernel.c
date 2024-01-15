void kernel_main(void)
{
    char* vMem=(char*)0xb8000;
    vMem[0] = 'H';
    vMem[1] = 0x04;
    vMem[2] = 'E';
    vMem[3] = 0x04;
}
void kernel_main(void)
{
    char* vMem=(char*)0xb8000;
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
    vMem[19] = 0x04;
}
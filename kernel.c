void kernel_main(void)
{
    char* vMem=(char*)0xb8000;
    vMem[0] = 'H';
    vMem[1] = 'E';
    vMem[2] = 'L';
    vMem[3] = 'L';
    vMem[4] = 'O';
    vMem[5] = ' ';
    vMem[6] = 'W';
    vMem[7] = 'O';
    vMem[8] = 'R';
    vMem[9] = 'L';
    vMem[10] = 'D';
}